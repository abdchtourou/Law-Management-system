
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({super.key,
    required this.rememberMe,
    required this.onChanged,
    required this.onForgotPressed,
  });

  final bool rememberMe;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onForgotPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'تذكّرني',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800),
        ),
        Checkbox(
          value: rememberMe,
          onChanged: onChanged == null ? null : (v) => onChanged!(v ?? false),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          activeColor: Colors.black,
          checkColor: const Color(0xffB0BEC5),
          visualDensity: VisualDensity.compact,
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPressed,
          child: Text(
            'نسيت كلمة المرور؟',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

