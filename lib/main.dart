import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lms/core/routing/app_router.dart';
import 'package:env_banner/env_banner.dart';
import 'core/config/env_config.dart';
import 'core/config/environment.dart';
import 'core/dependency_injection.dart';
import 'core/utils/LocaleCubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/cubit/auth_state.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() async {
  await mainCommon(environment: Environment.development);
}

Future<void> mainCommon({required Environment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await EnvConfig.initialize(environment: environment);
  
  await initializeDependencies();
  runApp(MyApp(
    appRouter: AppRouter(),
    environment: environment,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
    required this.environment,
  });
  
  final AppRouter appRouter;
  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<AuthCubit>()..checkAuthStatus()),
            BlocProvider(create: (_) => LocaleCubit()), // <-- locale provider
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                title: 'LMS - Clean Architecture',
                debugShowCheckedModeBanner: false,

                // 👇 This controls Directionality automatically
                locale: localeState.locale,
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'Cairo',
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: const Color(0xFFF6F7F9),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.black, width: 1.2),
                    ),
                    hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                    labelStyle: const TextStyle(color: Color(0xFF6B7280)),
                  ),
                ),
                onGenerateRoute: appRouter.generateRoute,
                
                // Use builder to wrap with environment banner for non-production builds
                builder: (context, child) {
                  if (environment.isProduction) {
                    return child!;
                  } else {
                    return EnvBanner(
                      color: environment.bannerColor!,
                      primary: environment.appName,
                      child: child!,
                    );
                  }
                },
                // home: CreateClientScreen(),
                // If you prefer a fallback when device locale is neither en/ar:
                // localeResolutionCallback: (deviceLocale, supported) =>
                //   supported.firstWhere((l) => l.languageCode == (deviceLocale?.languageCode ?? 'ar'), orElse: () => const Locale('ar')),
              );
            },
          ),
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is AuthAuthenticated) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
