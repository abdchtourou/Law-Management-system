import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side (logo)
            const Text(
              'Logo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),

            // Right side icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_rounded,
                      color: Colors.grey, size: 28),
                  onPressed: () {
                    // TODO: notification action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search_rounded,
                      color: Colors.grey, size: 28),
                  onPressed: () {
                    // TODO: search action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.menu_rounded,
                      color: Colors.grey, size: 30),
                  onPressed: () {
                    // 👇 يفتح السايد دراور من اليمين
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 24);
}
