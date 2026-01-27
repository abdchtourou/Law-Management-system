import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colorsManager.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/userManagementWidgets/user_card_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_management_cubit.dart';
import 'package:lms/features/auth/data/models/user_model.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorsManager.accent),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Text(
              'إدارة المستخدمين',
              style: TextStyles.font16BlackBold,
            ),
            10.horizontalSpace,
          ]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: BlocBuilder<UserManagementCubit, UserManagementState>(
            builder: (context, state) {
              if (state is UserManagementLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserManagementError) {
                return Center(child: Text(state.message));
              } else if (state is UserManagementLoaded) {
                print('hjkasdfjh ${state.users.first.firstName}');
                return Column(
                  children: [
                    if (state.isRefreshing)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Center(
                          child: SizedBox(
                            height: 3,
                            child: LinearProgressIndicator(),
                          ),
                        ),
                      ),
                    Expanded(
                      child: UserCardsTable(
                        data: state.users,
                        onAddUser: () {
                          context.pushNamed(Routes.createUser);
                        },
                        onCardTap: (user) {
                          context.pushNamed(Routes.userProfile,
                              arguments: user);
                        },
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
