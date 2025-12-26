import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/model/nav_model.dart';
import 'package:lms/features/home/presentation/cubit/home_cubit.dart';
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
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is HomeSuccess) {
              final data =state.homeModel;
              // TODO: Use state.homeModel to populate data
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TaskSummaryCard(
                            total: data.tasksStats!.total??0,
                            progress: data.tasksStats!.completionRate!,
                            icon: SvgPicture.asset(
                              noteSvg,
                              width: 50.w,
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                         Expanded(
                          child: CasesSummaryCard(
                            total: data.legalCasesStats!.total!,
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
                         Expanded(
                          child: UsersCountCard(
                            total: data.usersStats!.total!,
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
                      leading: const Icon(Icons.balance_outlined,
                          color: Colors.white, size: 64),
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
                      leading: SvgPicture.asset(
                        lawIconSvg,
                        colorFilter: const ColorFilter.mode(
                          ColorsManager.accent,
                          BlendMode.srcIn,
                        ),
                      ),
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
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
