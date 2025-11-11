import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/font_weight_helper.dart';
import 'package:lms/core/utils/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colorsManager.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/userManagementWidgets/user_card_table.dart';

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
            icon: Icon(Icons.arrow_back, color: ColorsManager.accent),
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
          child: UserCardsTable(
            onAddUser: () {
              context.pushNamed(Routes.createUser);
            },
            onCardTap: (user) {
              context.pushNamed(Routes.userProfile, arguments: user);
            },
          ),
        ),
      ),
    );
  }
}

enum UserRole { admin, manager, employee, agent, client }

class UserCardData {
  final int id;
  final String name;
  final String fatherName;
  final String grandFatherName;
  final String motherName;
  final String nationalId;
  final String birthDate;
  final String imageUrl;
  final UserRole role;

  UserCardData({
    required this.id,
    required this.name,
    required this.fatherName,
    required this.grandFatherName,
    required this.motherName,
    required this.nationalId,
    required this.birthDate,
    required this.imageUrl,
    required this.role,
  });
}




