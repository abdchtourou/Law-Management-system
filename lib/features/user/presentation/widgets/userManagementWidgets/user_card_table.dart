import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/features/user/presentation/widgets/userManagementWidgets/user_card.dart';

import '../../../../../core/constants/image_constants.dart';
import '../../../../../core/theming/colorsManager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../auth/data/models/user_model.dart';

class UserCardsTable extends StatefulWidget {
  const UserCardsTable({
    super.key,
    this.data,
    this.onAddUser,
    this.onCardTap,
  });

  final List<User>? data;
  final VoidCallback? onAddUser;
  final void Function(User user)? onCardTap;

  @override
  State<UserCardsTable> createState() => _UserCardsTableState();
}

class _UserCardsTableState extends State<UserCardsTable> {
  final TextEditingController _search = TextEditingController();
  int page = 1;
  final int perPage = 5;

  late List<User> all;

  @override
  void initState() {
    super.initState();
    all = widget.data ?? [];
  }

  @override
  void didUpdateWidget(covariant UserCardsTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      setState(() {
        all = widget.data ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _search.text.trim().toLowerCase();
    final filtered = all
        .where((u) =>
            q.isEmpty ||
            (u.firstName ?? '').toLowerCase().contains(q) ||
            (u.nationalId ?? '').contains(q) ||
            '#${u.userId ?? 0}'.contains(q))
        .toList();

    final pages = (filtered.length / perPage).ceil().clamp(1, 9999);
    page = page.clamp(1, pages);
    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, filtered.length);
    final items = filtered.sublist(start, end);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              12.verticalSpace,
              // Search + filter row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    10.horizontalSpace,
                    _RoundIconButton(icon: Icons.tune, onTap: () {}),
                  ],
                ),
              ),
              8.verticalSpace,
              // Add button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: ElevatedButton.icon(
                    onPressed: widget.onAddUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: Text(
                      'إضافة مستخدم',
                      style: TextStyles.font14WhiteBold,
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              // User cards - Scrollable Area
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...items.map(
                        (u) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          child: InkWell(
                            onTap: widget.onCardTap == null
                                ? null
                                : () => widget.onCardTap!(u),
                            borderRadius: BorderRadius.circular(16),
                            child: UserCard(user: u),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              12.verticalSpace,
              // Pagination footer
              _FooterPager(
                page: page,
                pages: pages,
                onPrev: page > 1 ? () => setState(() => page--) : null,
                onNext: page < pages ? () => setState(() => page++) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterPager extends StatelessWidget {
  const _FooterPager(
      {required this.page, required this.pages, this.onPrev, this.onNext});

  final int page;
  final int pages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          _CircleSoftButton(icon: Icons.chevron_left, onTap: onPrev),
          const Spacer(),
          Text('Page $page of $pages',
              style: const TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          const Spacer(),
          _CircleSoftButton(icon: Icons.chevron_right, onTap: onNext),
        ],
      ),
    );
  }
}

class _RoundedField extends StatelessWidget {
  const _RoundedField(
      {required this.controller,
      required this.hint,
      this.icon,
      this.onChanged});

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
        hintStyle: const TextStyle(color: Color(0xff475569), fontSize: 16),
        suffixIcon: icon != null ? Icon(icon, size: 20) : null,
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
          child: Icon(icon,
              color: onTap == null
                  ? const Color(0xFFCBD5E1)
                  : const Color(0xFF111827)),
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
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: ColorsManager.grey30,
            ),
          ),
          child: SvgPicture.asset(filterSvg)),
    );
  }
}
