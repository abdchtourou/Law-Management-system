
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
