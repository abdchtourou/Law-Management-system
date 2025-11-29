import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colorsManager.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/case_details_card.dart';
import 'manage_legal_case.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key, required this.data});

  final CaseData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorsManager.accent),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Text(
              'إدارة القضايا',
              style: TextStyles.font16BlackBold,
            ),
            20.horizontalSpace,
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: CaseDetailsCard(data: data),
      ),
    );
  }
}
