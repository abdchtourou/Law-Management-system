import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/features/auth/presentation/screens/home_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w) ,
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side icons (bell + search)
            Row(
              children: [
                Icon(Icons.menu_rounded, color: Colors.grey, size: 30),
                SizedBox(width: 16),
              ],
            ),

            // Center title (Logo)
            Text(
              'Logo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                SizedBox(width: 16),
                Icon(Icons.notifications_none_rounded, color: Colors.grey, size: 30),
                SizedBox(width: 20),
                Icon(Icons.search_rounded, color: Colors.grey, size: 30),
              ],
            ),

            // Right side menu icon
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 24);
}
