import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font14BlackBold = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16BlackBold = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12BlackExtraBold = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font10BlackMedium = TextStyle(
    fontSize: 10.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.medium,
  );
}
