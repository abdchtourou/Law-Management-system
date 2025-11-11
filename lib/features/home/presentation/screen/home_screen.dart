import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_side_drawer.dart';
import '../widgets/cases_summary_card.dart';
import '../widgets/clients_progress_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/task_summary_card.dart';
import '../widgets/users_count_card.dart';
import '../widgets/users_table_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const CustomAppBar(),
      endDrawer: const AppSideDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TaskSummaryCard(
                      total: 305,
                      progress: 0.7,
                      icon: Icon(Icons.description_outlined, size: 48.r, color: Colors.black87),
                    ),
                  ),
                  20.horizontalSpace,
                  const Expanded(
                    child: CasesSummaryCard(
                      total: 155,
                      openCount: 948,
                      closedCount: 948,
                      inProgressCount: 948,
                    ),
                  ),
                ],
              ),
              32.h.verticalSpace,
              Row(
                children: [
                  const Expanded(
                    child: UsersCountCard(
                      total: 11,
                      avatars: [
                        AssetImage('assets/avatars/a1.jpg'),
                        AssetImage('assets/avatars/a2.jpg'),
                        AssetImage('assets/avatars/a3.jpg'),
                        AssetImage('assets/avatars/a4.jpg'),
                        AssetImage('assets/avatars/a5.jpg'),
                        AssetImage('assets/avatars/a6.jpg'),
                        AssetImage('assets/avatars/a7.jpg'),
                      ],
                    ),
                  ),
                  20.w.horizontalSpace,
                  const Expanded(
                    child: ClientsProgressCard(total: 100, maleRatio: 1),
                  ),
                ],
              ),
              32.h.verticalSpace,
              DashboardCard(
                title: 'أحدث القضايا',
                leading: const Icon(Icons.balance_outlined, color: Colors.white, size: 64),
                items: const [
                  'قضية 11 : العميل: احمد اسماعيل - الحالة: قيد الإنجاز',
                  'قضية 12 : العميل: احمد اسماعيل - الحالة: قيد الإنجاز',
                  'قضية 13 : العميل: احمد اسماعيل - الحالة: قيد الإنجاز',
                ],
                background: const Color(0xFF3A3A3A),
                onTap: () {},
              ),
              const SizedBox(height: 28),
              DashboardCard(
                title: 'المهام',
                leading: const Icon(Icons.front_hand_outlined, color: Colors.white, size: 64),
                items: const [
                  'مهمة 11 : المكلّف: احمد اسماعيل - الحالة: قيد الإنجاز',
                  'مهمة 12 : المكلّف: احمد اسماعيل - الحالة: مكتملة',
                  'مهمة 13 : المكلّف: احمد اسماعيل - الحالة: لم تبدأ',
                ],
                background: const Color(0xFF000000),
                onTap: () {},
              ),
              30.h.verticalSpace,
              const UsersTablePage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF6A7884),
        activeColor: Colors.black,
        curveSize: 85.h,
        // size of the middle bump
        height: 55.h,
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home_rounded, title: 'الرئيسية'),
          TabItem(icon: Icons.search_rounded, title: 'المهام'),
          TabItem(icon: Icons.add, title: ''), // middle "+" button
          TabItem(icon: Icons.shopping_basket_outlined, title: 'القضايا'),
          TabItem(icon: Icons.person_outline, title: 'الموكلين'),
        ],
        initialActiveIndex: 0,
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
