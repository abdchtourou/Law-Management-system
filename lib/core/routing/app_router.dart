import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/routing/routes.dart';
import 'package:lms/features/task/presentation/cubit%20/taskType/task_type_cubit.dart';
import 'package:lms/features/task/presentation/cubit%20/taskType/task_type_state.dart';
import 'package:lms/features/task/presentation/screen/create_task_screen.dart';
import 'package:lms/features/task/presentation/screen/task_type_screen.dart';
import 'package:lms/features/user/presentation/cubit/create_user_cubit.dart';
import 'package:lms/features/user/presentation/cubit/create_client_cubit.dart';
import 'package:lms/features/user/presentation/cubit/user_management_cubit.dart';
import 'package:lms/features/user/presentation/screen/create_user_screen.dart';
import 'package:lms/features/user/presentation/screen/user_profile.dart';
import 'package:lms/features/auth/data/models/user_model.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screen/main_screen.dart';
import '../../features/legalCase/presentation/screen/create_legal_case_screen.dart';
import '../../features/legalCase/presentation/screen/manage_legal_case.dart';
import '../../features/user/presentation/screen/create_client_screen.dart';
import '../../features/user/presentation/screen/user_management_screen.dart';
import '../dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.userProfile:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UserProfileScreen(),
        );
      case Routes.createUser:
        final user = settings.arguments as User?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CreateUserCubit>(
            create: (context) {
              final cubit = sl<CreateUserCubit>();
              if (user != null) {
                cubit.initializeForEdit(user);
              }
              return cubit;
            },
            child: CreateUserScreen(),
          ),
        );
      case Routes.createClient:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<CreateClientCubit>(),
            child: const CreateClientScreen(),
          ),
        );
      case Routes.userManagement:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<UserManagementCubit>()..getAllUsers(),
            child: const UserManagementScreen(),
          ),
        );
      case Routes.createLegalCase:
        return MaterialPageRoute(builder: (_) => const CreateLegalCaseScreen());
      case Routes.legalCaseManagement:
        return MaterialPageRoute(builder: (_) => const CasesManagementScreen());
      case Routes.taskType:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => TaskTypeCubit(),
                  child: TaskTypeScreen(),
                ));

      default:
        return null;
    }
  }
}
