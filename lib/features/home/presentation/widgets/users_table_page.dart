import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/auth/data/models/user_model.dart';

enum UserStatus { online, idle, offline }

class UsersTablePage extends StatefulWidget {
  final List<User> users;

  const UsersTablePage({super.key, this.users = const []});

  @override
  State<UsersTablePage> createState() => _UsersTablePageState();
}

class _UsersTablePageState extends State<UsersTablePage> {
  final TextEditingController _search = TextEditingController();
  bool sortAsc = true;
  int page = 1;
  final int perPage = 8;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    final filtered = widget.users.where((u) {
      final q = _search.text.trim();
      if (q.isEmpty) return true;
      final name = u.fullName?.toLowerCase() ?? '';
      final id = u.userId?.toString() ?? '';
      return name.contains(q.toLowerCase()) || '#$id'.contains(q);
    }).toList()
      ..sort((a, b) {
        final nameA = a.fullName ?? '';
        final nameB = b.fullName ?? '';
        return sortAsc ? nameA.compareTo(nameB) : nameB.compareTo(nameA);
      });

    final pageCount = (filtered.length / perPage).ceil().clamp(1, 9999);
    page = page.clamp(1, pageCount);
    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, filtered.length);
    final rows = filtered.sublist(start, end);

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 18,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  // Search + icons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: _RoundedField(
                            controller: _search,
                            hint: 'Search...',
                            icon: Icons.search,
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(width: 10),
                        _RoundIconButton(
                          icon: Icons.tune,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Add button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.h,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {},
                        label: Text(
                          'إضافة مستخدم',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Header
                  _HeaderRow(
                    sortAsc: sortAsc,
                    onToggleSort: () => setState(() => sortAsc = !sortAsc),
                  ),
                  // Rows
                  ...rows.map((u) => _UserRowTile(user: u)),
                  // Footer / pagination
                  _FooterPager(
                    page: page,
                    pages: pageCount,
                    onPrev: page > 1 ? () => setState(() => page--) : null,
                    onNext:
                        page < pageCount ? () => setState(() => page++) : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({
    required this.sortAsc,
    required this.onToggleSort,
  });

  final bool sortAsc;
  final VoidCallback onToggleSort;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFFF3F5F7),
        border: Border(
          top: BorderSide(color: Color(0xFFE6E8EA)),
          bottom: BorderSide(color: Color(0xFFE6E8EA)),
        ),
      ),
      child: Row(
        children: [
          // Last login (left in RTL layout)
          Expanded(
            flex: 1,
            child: Text(
              'اخر تسجيل الدخول',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
            ),
          ),
          // Full name + sort chevron
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onToggleSort,
              borderRadius: BorderRadius.circular(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'الاسم الكامل',
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    sortAsc ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 18,
                    color: const Color(0xFF6B7280),
                  ),
                ],
              ),
            ),
          ),
          // ID
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'ID',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserRowTile extends StatelessWidget {
  const _UserRowTile({required this.user});

  final User user;

  Color _statusColor(bool isActive) {
    return isActive ? const Color(0xFF22C55E) : const Color(0xFFCBD5E1);
  }

  String _arabicDateTime(BuildContext context, String? dateStr) {
    if (dateStr == null) return 'N/A';
    try {
      final dt = DateTime.parse(dateStr);
      final isAm = dt.hour < 12;
      final hh = (dt.hour % 12 == 0) ? 12 : dt.hour % 12;
      final mm = dt.minute.toString().padLeft(2, '0');
      final period = isAm ? 'صباحاً' : 'مساءً';
      return '${dt.day}-${dt.month}-${dt.year}\n$hh:$mm $period';
    } catch (e) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: const Color(0xFF475569),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      height: 1.4,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              // Last login (two lines)
              Expanded(
                flex: 1,
                child: Text(
                  _arabicDateTime(context, user.lastLogin),
                  textAlign: TextAlign.right,
                  style: textStyle,
                ),
              ),
              // Full name
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(user.fullName ?? 'Unknown', style: textStyle),
                ),
              ),
              // ID + status dot
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('#${user.userId ?? '-'}', style: textStyle),
                    const SizedBox(width: 10),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _statusColor(user.isActive ?? false),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFFEAECEF)),
      ],
    );
  }
}

class _FooterPager extends StatelessWidget {
  const _FooterPager({
    required this.page,
    required this.pages,
    this.onPrev,
    this.onNext,
  });

  final int page;
  final int pages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE6E8EA))),
      ),
      child: Row(
        children: [
          _CircleSoftButton(
            icon: Icons.chevron_left,
            onTap: onPrev,
          ),
          const Spacer(),
          Text(
            'Page $page of $pages',
            style: const TextStyle(
              color: Color(0xFF475569),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          _CircleSoftButton(
            icon: Icons.chevron_right,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _RoundedField extends StatelessWidget {
  const _RoundedField({
    required this.controller,
    required this.hint,
    this.icon,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff475569),
          fontSize: 16,
        ),
        suffixIcon: icon != null
            ? Icon(
                icon,
                size: 20,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFFE6E8EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF3F5F7),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(Icons.tune, color: Color(0xFF6B7280)),
        ),
      ),
    );
  }
}

class _CircleSoftButton extends StatelessWidget {
  const _CircleSoftButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF3F5F7),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40.w,
          height: 40.h,
          child: Icon(
            icon,
            color: onTap == null
                ? const Color(0xFFCBD5E1)
                : const Color(0xFF111827),
          ),
        ),
      ),
    );
  }
}
