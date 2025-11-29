import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/constants/image_constants.dart';
import 'package:lms/core/theming/colorsManager.dart';

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
                      icon: SvgPicture.asset(noteSvg,width: 50.w,),
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
                        NetworkImage('https://i.pravatar.cc/150?img=1'),
                        NetworkImage('https://i.pravatar.cc/150?img=2'),
                        NetworkImage('https://i.pravatar.cc/150?img=3'),
                        NetworkImage('https://i.pravatar.cc/150?img=4'),
                        NetworkImage('https://i.pravatar.cc/150?img=4'),
                        NetworkImage('https://i.pravatar.cc/150?img=6'),
                        NetworkImage('https://i.pravatar.cc/150?img=7'),
                        NetworkImage('https://i.pravatar.cc/150?img=8'),
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
                leading: SvgPicture.asset(color: ColorsManager.accent,lawIconSvg,),
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

