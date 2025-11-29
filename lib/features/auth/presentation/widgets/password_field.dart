
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key,
    required this.controller,
    this.enabled = true,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: _obscure,
      decoration: inputDecoration(
        hint: '••••••••••••',
        suffix: IconButton(
          tooltip: _obscure ? 'إظهار' : 'إخفاء',
          onPressed: widget.enabled ? () => setState(() => _obscure = !_obscure) : null,
          icon: Icon(
            _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: const Color(0xff737373),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'أدخل كلمة المرور';
        }
        if (value.length < 6) {
          return 'كلمة المرور لا تقل عن 6 أحرف';
        }
        return null;
      },
    );
  }
}
InputDecoration inputDecoration({
  String? hint,
  Widget? suffix,
})
{
  final baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.r),
    borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
  );

  return InputDecoration(
    hintText: hint,
    suffixIcon: suffix,
    filled: true,
    fillColor: const Color(0xFFF6F7F9),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
    border: baseBorder,
    enabledBorder: baseBorder,
    focusedBorder: baseBorder.copyWith(
      borderSide: BorderSide(color: Colors.black, width: 1.2.w),
    ),
    hintStyle: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp),
  );
}
