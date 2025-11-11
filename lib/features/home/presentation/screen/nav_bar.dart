import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  final int pageIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      child: BottomAppBar(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 60.h,
            color: Colors.white,
            child: Row(
              children: [
                navItem(Icons.home, pageIndex == 0, onTap: () => onTap(0)),
                navItem(Icons.search, pageIndex == 1, onTap: () => onTap(1)),
                navItem(Icons.favorite, pageIndex == 2, onTap: () => onTap(2)),
                navItem(Icons.person, pageIndex == 3, onTap: () => onTap(3)),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
      child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: selected ? Colors.black : Colors.grey,
            size: 25.sp,
          )));
}
