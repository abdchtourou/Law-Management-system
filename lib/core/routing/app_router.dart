import 'package:flutter/material.dart';
import 'package:lms/core/routing/routes.dart';
import 'package:lms/features/user/presentation/screen/user_profile.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/user/presentation/screen/create_user_screen.dart';
import '../../features/user/presentation/screen/user_management_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case Routes.createUser:
        return MaterialPageRoute(builder: (_) => const CreateUserScreen());
      case Routes.userManagement:
        return MaterialPageRoute(builder: (_) => const UserManagementScreen());

      default:
        return null;
    }
  }
}
