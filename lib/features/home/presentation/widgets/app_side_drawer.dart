import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/routing/routes.dart';
import 'package:lms/core/utils/extensions.dart';
import 'package:lms/features/home/presentation/screen/home_screen.dart';

class AppSideDrawer extends StatelessWidget {
  const AppSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const grey = Color(0xFF6B7280);
    const cardBorder = Color(0xFFE6E8EA);
    const cardBg = Color(0xFFF8FAFB);

    return Drawer(
      width: 320,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
            children: [
              // Header (avatar + name + role)
              const Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/avatars/a1.jpg'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Azunyan U. Wu',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Basic Member',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.wb_sunny_outlined, color: grey),
                ],
              ),
              const SizedBox(height: 16),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: 'نص مقترح',
                  suffixIcon: const Icon(Icons.search, color: grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: cardBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: cardBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),

              const SizedBox(height: 18),
              const _SectionTitle('إدارة المستخدمين'),
              _SectionCard(
                children: [
                  _LineItem(title: 'إنشاء مستخدم جديد', icon: Icons.person_add_alt_1_outlined, onTap: () {
                    context.pushNamed(Routes.createUser);
                      }),
                   _LineItem(title: 'إدارة المستخدمين', icon: Icons.group_outlined,onTap: (){
                     context.pushNamed(Routes.userManagement);
                   },),
                  const _LineItem(title: 'إنشاء عميل', icon: Icons.person_outline),
                ],
              ),

              const SizedBox(height: 16),
              const _SectionTitle('إدارة القضايا'),
              const _SectionCard(
                children: [
                  _LineItem(title: 'إنشاء قضية قانونية', icon: Icons.gavel_outlined),
                  _LineItem(title: 'إدارة القضايا القانونية', icon: Icons.receipt_long_outlined),
                  _LineItem(title: 'إدارة أنواع المهام', icon: Icons.folder_open_outlined),
                  _LineItem(title: 'إسناد المهام', icon: Icons.event_note_outlined),
                ],
              ),

              const SizedBox(height: 16),
              const _SectionTitle('الوكالة القانونية'),
              const _SectionCard(
                children: [
                  _LineItem(title: 'إنشاء وكالة قانونية', icon: Icons.edit_note_outlined),
                  _LineItem(title: 'إدارة الوكالة القانونية', icon: Icons.fact_check_outlined),
                ],
              ),

              const SizedBox(height: 16),
              const _SectionTitle('الوثائق والمستندات'),
              const _SectionCard(
                children: [
                  _LineItem(title: 'ملفات القضايا', icon: Icons.description_outlined),
                  _LineItem(title: 'ملفات المهام', icon: Icons.article_outlined),
                  _LineItem(title: 'ملفات الوكالة القانونية', icon: Icons.feed_outlined),
                  _LineItem(title: 'ملفات أخرى', icon: Icons.edit_outlined),
                ],
              ),

              const SizedBox(height: 16),
              // Calendar single tile
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: const Icon(Icons.calendar_month_outlined, color: grey),
                title: const Text(
                  'التقويم',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                onTap: () {},
              ),

              const SizedBox(height: 16),
              // Logout big button
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: cardBorder),
                ),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.black87),
                  label: const Text(
                    'تسجيل الخروج',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {
                    // TODO: handle logout
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---- helpers ----

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E8EA)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            if (i != 0) const Divider(height: 1, color: Color(0xFFEAECEF)),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _LineItem extends StatelessWidget {
  const _LineItem({required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const grey = Color(0xFF6B7280);
    return ListTile(
      onTap: onTap,
      dense: true,
      minVerticalPadding: 12,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      trailing: Icon(icon, color: grey),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w700,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}
