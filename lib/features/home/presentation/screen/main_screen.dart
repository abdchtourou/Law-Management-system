import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/dependency_injection.dart';
import 'package:lms/features/home/data/model/nav_model.dart';
import 'package:lms/features/home/presentation/cubit/home_cubit.dart';
import 'package:lms/features/home/presentation/screen/add_screen.dart';
import 'package:lms/features/home/presentation/screen/cases_screen.dart';
import 'package:lms/features/home/presentation/screen/clients_screen.dart';
import 'package:lms/features/home/presentation/screen/home_screen.dart';
import 'package:lms/features/home/presentation/screen/tasks_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final tasksNavKey = GlobalKey<NavigatorState>();
  final addNavKey = GlobalKey<NavigatorState>();
  final casesNavKey = GlobalKey<NavigatorState>();
  final clientsNavKey = GlobalKey<NavigatorState>();
  int _selectedTap = 0;
  List<NavModel> navItems = [];
  @override
  initState() {
    super.initState();
    navItems = [
      NavModel(
        navKey: homeNavKey,
        page: BlocProvider(
          create: (context) => sl<HomeCubit>()..getHomeData(),
          child: const HomeScreen(),
        ),
      ),
      NavModel(
        navKey: tasksNavKey,
        page: const TasksScreen(),
      ),
      NavModel(
        navKey: addNavKey,
        page: const AddScreen(),
      ),
      NavModel(
        navKey: casesNavKey,
        page: const CasesScreen(),
      ),
      NavModel(
        navKey: clientsNavKey,
        page: const ClientsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTap,
        children: navItems.map((item) => item.page).toList(),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF6A7884),
        activeColor: Colors.black,
        curveSize: 85.h,
        // size of the middle bump
        height: 55.h,
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home_rounded, title: 'الرئيسية'),
          TabItem(icon: Icons.search_rounded, title: 'المهام'),
          TabItem(icon: Icons.add, title: ''), // middle "+" button
          TabItem(icon: Icons.shopping_basket_outlined, title: 'القضايا'),
          TabItem(icon: Icons.person_outline, title: 'الموكلين'),
        ],
        initialActiveIndex: _selectedTap,
        onTap: (int i) => setState(() => _selectedTap = i),
      ),
    );
  }
}
