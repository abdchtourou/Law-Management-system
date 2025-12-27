import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// If you use SVG icons, uncomment this and use SvgPicture instead of Icon.
// import 'package:flutter_svg/flutter_svg.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.items,
    required this.leading,
    this.background = const Color(0xFF2C2C2C), // dark gray like the screenshot
    this.onTap,
    this.showChevron = true,
  });

  final String title;
  final List items;
  final Widget leading; // e.g. Icon(...) or SvgPicture.asset(...)
  final Color background;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    // Force RTL so alignment matches your Arabic UI
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding:  EdgeInsets.symmetric(vertical: 18.h,horizontal: 16),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                blurRadius: 18,
                spreadRadius: -2,
                offset: Offset(0, 10),
                color: Color(0x66000000),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + lines
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          ),
                        ),
                         SizedBox(height: 9.h),
                        ...items.map(
                              (t) => Padding(
                            padding:  EdgeInsets.only(bottom: 8.0.h),
                            child: Row(
                              children: [
                                Text(
                                  "  قضية ${t.taskId} :",
                                  style: TextStyle(
                                    color: const Color(0xffB0BEC5),
                                    fontSize: 11.sp,
                                    height: 1.3,
                                  ),
                                  maxLines: 1,
                                ),

                                Text(
                                  "  ${t.title}",
                                  style: TextStyle(
                                    color: const Color(0xffB0BEC5),
                                    fontSize: 11.sp,
                                    height: 1.3,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                ),

                                Text(
                                  "  ${t.assigneeName}",
                                  style: TextStyle(
                                    color: const Color(0xffB0BEC5),
                                    fontSize: 11.sp,
                                    height: 1.3,
                                  ),
                                  maxLines: 1,
                                  textDirection: TextDirection.rtl,
                                ),

                                Expanded(
                                  child: Text(
                                    "  ${t.statusName}",
                                    style: TextStyle(
                                      color: const Color(0xffB0BEC5),
                                      fontSize: 11.sp,
                                      height: 1.3,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            )
                                ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: FittedBox(child: leading),
                      ),
                    ),
                  ),

                ],
              ),
              if (showChevron) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.expand_more,
                    color: Colors.white.withOpacity(0.9),
                    size: 28,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
