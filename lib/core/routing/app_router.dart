import 'package:flutter/material.dart';
import 'package:lms/core/routing/routes.dart';
import 'package:lms/features/user/presentation/screen/create_user_screen.dart';
import 'package:lms/features/user/presentation/screen/user_profile.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screen/main_screen.dart';
import '../../features/legalCase/presentation/screen/create_legal_case_screen.dart';
import '../../features/legalCase/presentation/screen/manage_legal_case.dart';
import '../../features/user/presentation/screen/create_client_screen.dart';
import '../../features/user/presentation/screen/user_management_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case Routes.createUser:
        return MaterialPageRoute(builder: (_) => const CreateUserScreen());
      case Routes.createClient:
        return MaterialPageRoute(builder: (_) => const CreateClientScreen());
      case Routes.userManagement:
        return MaterialPageRoute(builder: (_) => const UserManagementScreen());
      case Routes.createLegalCase:
        return MaterialPageRoute(builder: (_) => const CreateLegalCaseScreen());
      case Routes.legalCaseManagement:
        return MaterialPageRoute(builder: (_) => const CasesManagementScreen());

      default:
        return null;
    }
  }
}
