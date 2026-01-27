import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colorsManager.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../auth/data/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  Color get _badgeColor {
    final roleName = (user.roleName ?? '').toLowerCase();
    if (roleName.contains('admin')) return const Color(0xFF3AA65A);
    if (roleName.contains('manager')) return const Color(0xFF1F4E6B);
    if (roleName.contains('employee')) return const Color(0xFF94A3B8);
    if (roleName.contains('agent')) return const Color(0xFF737373);
    return const Color(0xFF52525B); // client
  }

  String get _roleLabel {
    return user.roleName ?? 'عميل';
  }

  IconData get _roleIcon {
    final roleName = (user.roleName ?? '').toLowerCase();
    if (roleName.contains('admin')) return Icons.verified_user;
    if (roleName.contains('manager')) return Icons.security;
    if (roleName.contains('employee')) return Icons.badge;
    if (roleName.contains('agent')) return Icons.people;
    return Icons.people; // client
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.accent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(14.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top line: name + id
                Row(
                  children: [
                    Expanded(child: _kv1('الاسم :', user.firstName ?? '')),
                    Text('#${user.userId ?? 0}',
                        style: TextStyle(color: Colors.black, fontSize: 10.sp)),
                    10.horizontalSpace,
                    _RoleBadge(
                      color: _badgeColor,
                      icon: _roleIcon,
                      text: _roleLabel,
                    ),
                  ],
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Expanded(child: _kv('اسم الأب :', user.fatherName ?? '')),
                    Expanded(
                        child: _kv('تاريخ الميلاد :', user.birthDate ?? '')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _kv('اسم الأم :', user.motherName ?? '')),
                    Expanded(
                        child: _kv('الرقم الوطني :', user.nationalId ?? '')),
                  ],
                ),
                4.verticalSpace,
              ],
            ),
          ),
          12.horizontalSpace,
          Container(
            height: 82.r,
            width: 55.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(user.profilePicture ??
                    'https://i.pravatar.cc/150?img=${(user.userId ?? 0) % 10}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kv1(String k, String v) => Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Row(
          children: [
            Text(
              k,
              style: TextStyles.font12BlackExtraBold,
            ),
            4.horizontalSpace,
            Flexible(
              child: Text(
                v,
                style: TextStyles.font12BlackExtraBold,
              ),
            ),
          ],
        ),
      );

  Widget _kv(String k, String v) => Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Row(
          children: [
            Text(
              k,
              style: TextStyles.font10BlackMedium,
            ),
            4.horizontalSpace,
            Flexible(
              child: Text(
                v,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font10BlackMedium,
              ),
            ),
          ],
        ),
      );
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge(
      {required this.color, required this.icon, required this.text});

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color.withOpacity(.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: color),
          4.horizontalSpace,
          Text(
            text,
            style: TextStyle(
                color: color, fontSize: 12.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
