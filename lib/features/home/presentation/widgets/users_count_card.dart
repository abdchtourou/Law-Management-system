import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/utils/app_localizations.dart';
import 'package:lms/core/constants/image_constants.dart';
import 'package:lms/core/theming/colorsManager.dart';

// الأزرق الداكن بالشكل
// خلفية شريط التقدم
// رمادي مائل للأزرق

//==============================//
// بطاقة عدد المستخدمين + أفاتارات
//==============================//
class UsersCountCard extends StatelessWidget {
  const UsersCountCard({
    super.key,
    required this.total,
    required this.avatars, // روابط/أصول الصور
  });

  final int total;
  final List<ImageProvider> avatars;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${AppLocalizations.of(context)!.translate('usersCount')}: $total',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      height: 1.1,
                    ),
                  ),
                ),
                12.w.horizontalSpace,
                SvgPicture.asset(
                  groupSvg,
                  color: ColorsManager.blue600,
                )
              ],
            ),
            18.h.verticalSpace,
            _OverlappedAvatars(
              images: avatars,
              size: 32.r,
              overlap: 16.r,
              elevation: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _OverlappedAvatars extends StatelessWidget {
  const _OverlappedAvatars({
    required this.images,
    this.size = 40,
    this.overlap = 14,
    this.elevation = 0,
  });

  final List<ImageProvider> images;
  final double size;
  final double overlap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Stack(
        children: [
          for (int i = 0; i < images.length; i++)
            Positioned(
              left: i * (size - overlap),
              child: Material(
                color: Colors.transparent,
                elevation: elevation,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  radius: size / 2,
                  backgroundImage: images[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
