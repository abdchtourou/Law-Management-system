import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/font_weight_helper.dart';

import 'colorsManager.dart';

class TextStyles {
  static TextStyle font14WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16BlackExtraBold = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font16grey60Medium = TextStyle(
    color: ColorsManager.grey60,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12BlackExtraBold = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font12BlackRegular = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font12AccentMedium = TextStyle(
    fontSize: 12.sp,
    color: ColorsManager.accent1,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font10BlackMedium = TextStyle(
    fontSize: 10.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font10BlackBold = TextStyle(
    fontSize: 10.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font28BlackExtraBold = TextStyle(
    color: Colors.black,
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
  );

}
