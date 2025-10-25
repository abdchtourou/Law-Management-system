import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/email_field.dart';
import '../widgets/field_label.dart';
import '../widgets/logo_header.dart';
import '../widgets/password_field.dart';
import '../widgets/remember_forgot_row.dart';
import '../widgets/submit_button.dart';
import '../widgets/title_block.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 130.h, 16.w, 24.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LogoHeader(),
                    SizedBox(height: 8.h),
                    const TitleBlock(),
                    SizedBox(height: 35.h),
                    FieldLabel(text: 'البريد الإلكتروني', bottom: 11.h),
                    EmailField(
                      controller: _emailController,
                      enabled: !isLoading,
                    ),
                    SizedBox(height: 18.h),
                    const FieldLabel(text: 'كلمة المرور', bottom: 8),
                    PasswordField(
                      controller: _passwordController,
                      enabled: !isLoading,
                    ),
                    SizedBox(height: 35.h),
                    RememberForgotRow(
                      rememberMe: _rememberMe,
                      onChanged: (t) {},
                      onForgotPressed: isLoading
                          ? null
                          : () {
                              // TODO: navigate to reset password
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('واجهة استعادة كلمة المرور')),
                              );
                            },
                    ),
                    SizedBox(height: 24.h),
                    SubmitButton(
                      isLoading: isLoading,
                      onPressed: isLoading ? null : _handleLogin,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
