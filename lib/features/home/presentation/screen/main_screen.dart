import 'package:flutter/material.dart';
import 'package:lms/features/home/data/model/nav_model.dart';
import 'package:lms/features/home/presentation/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final cartNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int _selectedTap = 0;
  List<NavModel> navItems = [];
  initState() {
    super.initState();
    navItems = [
      NavModel(
        navKey: homeNavKey,
        page: const HomeScreen(),
      ),
      NavModel(
        navKey: cartNavKey,
        page: Container(
          child: const Center(
            child: Text('Cart'),
          ),
        ),
      ),
      NavModel(
        navKey: profileNavKey,
        page: Container(
          child: const Center(
            child: Text('Profile'),
          ),
        ),
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
    );
  }
}
