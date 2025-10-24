import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

/// Login screen for user authentication
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController(text: 'ahmedazy.uxui@gmail.com');
  final _password = TextEditingController(text: '************');
  bool _obscure = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                // Logo circle
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: const Text(
                      'Logo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Title
                Text(
                  'أهلاً بعودتك!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF111827),
                    letterSpacing: .2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ادخل البيانات التالية لنتمكن من الوصول إلى حسابك!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 28),

                // Email
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'البريد الإلكتروني',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'name@example.com',
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'أدخل البريد الإلكتروني';
                    final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim());
                    return ok ? null : 'بريد إلكتروني غير صالح';
                  },
                ),
                const SizedBox(height: 18),

                // Password
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'كلمة المرور',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    hintText: '••••••••••••',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      tooltip: _obscure ? 'إظهار' : 'إخفاء',
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(_obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'أدخل كلمة المرور' : null,
                ),
                const SizedBox(height: 14),

                // Remember + Forgot
                Row(
                  children: [
                    // تذكّرني
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          visualDensity: VisualDensity.compact,
                          onChanged: (v) => setState(() => _rememberMe = v ?? false),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'تذكّرني',
                          style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // TODO: navigate to reset page
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ميزة استرجاع كلمة المرور (UI فقط).')),
                        );
                      },
                      child: const Text('نسيت كلمة المرور؟', style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Submit button
                SizedBox(
                  width: w,
                  height: 56,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('تسجيل الدخول${_rememberMe ? ' (مع التذكّر)' : ''}'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}