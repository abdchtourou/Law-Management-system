import 'package:flutter/material.dart';
import 'package:lms/features/auth/presentation/widgets/password_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.controller,
    this.enabled = true,
  });

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.emailAddress,
      decoration: inputDecoration(
        hint: 'name@example.com',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'أدخل البريد الإلكتروني';
        }
        final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim());
        return ok ? null : 'بريد إلكتروني غير صالح';
      },
    );
  }
}
