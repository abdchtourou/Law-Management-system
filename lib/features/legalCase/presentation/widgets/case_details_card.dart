import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/theming/colorsManager.dart';
import 'package:lms/core/theming/styles.dart';

import '../../../../core/constants/image_constants.dart';
import '../screen/manage_legal_case.dart';

class CaseDetailsCard extends StatelessWidget {
  const CaseDetailsCard({super.key, required this.data});

  final CaseData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color:  ColorsManager.grey200,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          width: 2,
          color: ColorsManager.accent
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' المعرف 1',
                      style: TextStyles.font12BlackExtraBold,
                    ),
                    12.verticalSpace,
                    _infoLine('الجهة الرسمية :', 'محكمة الريف'),
                    _infoLine('اسم الموكل :', 'احمد كمال الدين'),
                    _infoLine('اسم الخصم :', 'محمد سعيد رمضان'),
                    _infoLine('أسماء المحامين :', ''),
                    _infoLine('', 'محمد سعيد رمضان،   رمضان'),
                    _infoLine('تاريخ الفصل :', '2025-5-22'),
                    8.verticalSpace,
                  ],
                ),
              ),
              SvgPicture.asset(noteSvg),
            ],
          ),
          Text(
            ' الوصف',
            style: TextStyles.font12BlackExtraBold,
          ),
          4.verticalSpace,

          // description + "اقرأ المزيد..."
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'قضية اتفاق بيع عقار مدني حول عقد بيع عقار بين الطرفين، حيث يدّعي المشتري بأن البائع لم يلتزم بشروط العقد المتفق عليها، وتم رفع الدعوى للمطالبة بتنفيذ العقد أو التعويض عن الأضرار المالية والصعوبات الناتجة عن التأخر في التسليم وفقًا للأنظمة والقوانين المعمول بها. ',
                  style: TextStyles.font12BlackRegular.copyWith(
                    height: 2,
                  ),
                ),
                 TextSpan(
                  text: 'اقرأ المزيد...',
                  style: TextStyle(
                    color: const Color(0xFF2563EB),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  // onTap: add GestureRecognizer if you want real expand
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),

          8.verticalSpace,
          _infoLine('تاريخ القيد :', '2025-5-22'),

          16.verticalSpace,

          // ملف القضية title + three dots
            Row(
            children: [
              Text(
                'ملف القضية',
                style: TextStyles.font12BlackExtraBold,
              ),
              const Spacer(),

              const Icon(Icons.more_vert, color: ColorsManager.grey600),

            ],
          ),

          8.verticalSpace,

          // file container
          Container(
            height: 145.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorsManager.grey500,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: ColorsManager.grey800,
                width: 1.5.w,
              ),
            ),
            child:  Center(
              child: SvgPicture.asset(descriptionFileSvg)),
          ),

          16.verticalSpace,

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: update case
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF111827),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 18,
                    ),
                    label:  Text(
                      'تحديث البيانات',
                      style: TextStyles.font14WhiteBold,
                    ),
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: delete case
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF4444),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 18,
                    ),
                    label:  Text(
                      'حذف القضية',
                      style: TextStyles.font14WhiteBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _infoLine(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyles.font12BlackRegular,
          ),
          4.horizontalSpace,
          Text(
            value,
            style: TextStyles.font12BlackRegular,
          ),
        ],
      ),
    );
  }
}
