import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/id_image_placeholder.dart';
import '../widgets/info_row.dart';
import '../widgets/log_row.dart';
import '../widgets/role_chip.dart';
import '../widgets/section_title.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F6F7);

    return Scaffold(
      backgroundColor: bg,
      appBar: const CustomAppBar(
        title: 'تفاصيل المستخدم',

      )
      ,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              children: [
                CustomCard(
                  child: Row(
                    children: [
                      // Avatar
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const _KV('الاسم', 'محمد سعيد رمضان', bold: true),
                            SizedBox(height: 6.h),
                            const _KV('اسم الأب', 'محمد سعيد رمضان'),
                            const _KV('اسم الأم', 'محمد سعيد رمضان'),
                            const _KV('التولد', '2000 - 5 - 11'),
                            const _KV('الرقم الوطني', '0032546545646'),
                            SizedBox(height: 16.h),
                            const RoleChip(label: 'مدير'),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // Name + labels
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://i.pravatar.cc/160?img=5',
                          width: 120.w,
                          height: 187.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // Address & contacts
                const CustomCard(
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'العنوان',
                        value: 'دمشق - المزة - بناء 5 رقم 5',
                      ),
                      _Divider(),
                      InfoRow(
                        icon: Icons.public_outlined,
                        label: 'الدولة',
                        value: 'سوريا',
                      ),
                      _Divider(),
                      InfoRow(
                        icon: Icons.map_outlined,
                        label: 'المحافظة',
                        value: 'دمشق',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                const CustomCard(
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.email_outlined,
                        label: 'البريد الالكتروني',
                        value: 'user@gmail.com',
                      ),
                      _Divider(),
                      InfoRow(
                        icon: Icons.phone_outlined,
                        label: 'رقم 1',
                        value: '099 454 5566',
                      ),
                      _Divider(),
                      InfoRow(
                        icon: Icons.phone_outlined,
                        label: 'رقم 2',
                        value: '095 546 6446',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // Login records
                const CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle('تسجيل الدخول', icon: Icons.search_rounded),
                      SizedBox(height: 6),
                      LogRow(date: '11-8-2020', time: '10:30 صباحاً'),
                      _Divider(),
                      LogRow(date: '11-8-2020', time: '10:30 صباحاً'),
                      _Divider(),
                      LogRow(date: '11-8-2020', time: '10:30 صباحاً'),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // ID image
                const CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle('صورة الهوية', icon: Icons.insert_photo_outlined),
                      SizedBox(height: 8),
                      IdImagePlaceholder(),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Bottom actions
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.autorenew_rounded, size: 18),
                          label: const Text('تحديث البيانات', style: TextStyle(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline, size: 20),
                          label: const Text('حذف المستخدم', style: TextStyle(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE74C3C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _KV extends StatelessWidget {
  final String k;
  final String v;
  final bool bold;

  const _KV(this.k, this.v, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    const kStyle = TextStyle(color: Color(0xFF6B7280), fontSize: 13);
    final vStyle = TextStyle(
      color: const Color(0xFF111827),
      fontSize: 14,
      fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$k : ', style: kStyle),
          Expanded(child: Text(v, style: vStyle)),
        ],
      ),
    );
  }
}
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 1,
      color: const Color(0xFFE9EDF0),
    );
  }
}





