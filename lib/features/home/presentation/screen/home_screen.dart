import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/constants/image_constants.dart';
import 'package:lms/core/theming/colorsManager.dart';

// ... (keep your existing widget imports here)
import '../../../../core/utils/app_localizations.dart';
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
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else if (state is HomeSuccess) {
                // 1. USE CURRENT DATA (The stable data)
                final data = state.currentData;

                return Stack(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: state.hasUpdate ? 60.h : 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TaskSummaryCard(
                                  total: data.tasksStats!.total ?? 0,
                                  progress: data.tasksStats!.completionRate!,
                                  icon: SvgPicture.asset(noteSvg, width: 50.w),
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: CasesSummaryCard(
                                  total: data.legalCasesStats!.total!,
                                  openCount: data.legalCasesStats!.open ??0,
                                  closedCount: 948,
                                  inProgressCount: data.legalCasesStats!.resolved ??0,
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
                                  avatars: const [
                                    NetworkImage(
                                        'https://i.pravatar.cc/150?img=1'),
                                    NetworkImage(
                                        'https://i.pravatar.cc/150?img=2'),
                                    NetworkImage(
                                        'https://i.pravatar.cc/150?img=3'),
                                    NetworkImage(
                                        'https://i.pravatar.cc/150?img=4'),
                                  ],
                                ),
                              ),
                              20.w.horizontalSpace,
                              const Expanded(
                                child: ClientsProgressCard(
                                    total: 100, maleRatio: 1),
                              ),
                            ],
                          ),
                          32.h.verticalSpace,
                          DashboardCard(
                            title: AppLocalizations.of(context)!
                                .translate('latestCases'),
                            leading: const Icon(Icons.balance_outlined,
                                color: Colors.white, size: 64),
                            items: data.recentCases!,
                            background: const Color(0xFF3A3A3A),
                            onTap: () {},
                          ),
                          const SizedBox(height: 28),
                          DashboardCard(
                            title: AppLocalizations.of(context)!
                                .translate('tasks'),
                            leading: SvgPicture.asset(
                              lawIconSvg,
                              colorFilter: const ColorFilter.mode(
                                  ColorsManager.accent, BlendMode.srcIn),
                            ),
                            items: data.recentTasks!,
                            background: const Color(0xFF000000),
                            onTap: () {},
                          ),
                          30.h.verticalSpace,
                          UsersTablePage(users: state.currentUsers),
                        ],
                      ),
                    ),

                    // --- Animated Update Button (Old UI with Animation) ---
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      top: state.hasUpdate ? 0 : -60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            context.read<HomeCubit>().applyUpdate();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: ColorsManager.accent,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.arrow_upward,
                                    color: Colors.white, size: 16),
                                8.horizontalSpace,
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('updateNewData'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
