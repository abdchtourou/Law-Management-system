import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/routing/routes.dart';
import '../../../auth/data/models/user_model.dart';
import '../widgets/custom_card.dart';
import '../widgets/id_image_placeholder.dart';
import '../widgets/info_row.dart';
import '../widgets/role_chip.dart';
import '../widgets/section_title.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user object from route arguments
    final user = ModalRoute.of(context)?.settings.arguments as User?;

    if (user == null) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'تفاصيل المستخدم'),
        body: const Center(
          child: Text('لا توجد بيانات مستخدم'),
        ),
      );
    }

    const bg = Color(0xFFF5F6F7);

    return Scaffold(
      backgroundColor: bg,
      appBar: const CustomAppBar(
        title: 'تفاصيل المستخدم',
      ),
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
                      // User Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _KV('الاسم', user.fullName ?? 'غير متوفر',
                                bold: true),
                            SizedBox(height: 6.h),
                            _KV('الاسم الأول', user.firstName ?? 'غير متوفر'),
                            _KV('الاسم الأخير', user.lastName ?? 'غير متوفر'),
                            _KV('اسم الأب', user.fatherName ?? 'غير متوفر'),
                            _KV('اسم الأم', user.motherName ?? 'غير متوفر'),
                            _KV('التولد', user.birthDate ?? 'غير متوفر'),
                            _KV('العمر', user.age?.toString() ?? 'غير متوفر'),
                            _KV('الجنس', user.gender ?? 'غير متوفر'),
                            _KV('الرقم الوطني', user.nationalId ?? 'غير متوفر'),
                            SizedBox(height: 16.h),
                            RoleChip(label: user.roleName ?? 'مستخدم'),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: user.profilePicture != null &&
                                user.profilePicture!.isNotEmpty
                            ? Image.network(
                                user.profilePicture!,
                                width: 120.w,
                                height: 187.h,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return _DefaultAvatar(
                                      width: 120.w, height: 187.h);
                                },
                              )
                            : _DefaultAvatar(width: 120.w, height: 187.h),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // Address & location
                CustomCard(
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'العنوان',
                        value: user.address ?? 'غير متوفر',
                      ),
                      const _Divider(),
                      InfoRow(
                        icon: Icons.public_outlined,
                        label: 'الدولة',
                        value: user.country ?? 'غير متوفر',
                      ),
                      const _Divider(),
                      InfoRow(
                        icon: Icons.map_outlined,
                        label: 'المحافظة',
                        value: user.governorate ?? 'غير متوفر',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // Contact info
                CustomCard(
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.email_outlined,
                        label: 'البريد الالكتروني',
                        value: user.email ?? 'غير متوفر',
                      ),
                      const _Divider(),
                      InfoRow(
                        icon: Icons.phone_outlined,
                        label: 'رقم 1',
                        value: user.mainPhone ?? 'غير متوفر',
                      ),
                      if (user.secondaryPhone != null &&
                          user.secondaryPhone!.isNotEmpty) ...[
                        const _Divider(),
                        InfoRow(
                          icon: Icons.phone_outlined,
                          label: 'رقم 2',
                          value: user.secondaryPhone!,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // Login records
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle('معلومات الحساب',
                          icon: Icons.info_outline),
                      const SizedBox(height: 12),
                      _KV('رقم المستخدم', '#${user.userId ?? "N/A"}'),
                      _KV('رقم المصادقة', '#${user.userAuthId ?? "N/A"}'),
                      _KV('الحالة', user.isActive == true ? 'نشط' : 'غير نشط'),
                      _KV('آخر تسجيل دخول', user.lastLogin ?? 'غير متوفر'),
                      _KV('تاريخ الإنشاء', user.createdAt ?? 'غير متوفر'),
                      _KV('آخر تحديث', user.updatedAt ?? 'غير متوفر'),
                      if (user.createdByName != null)
                        _KV('أنشئ بواسطة', user.createdByName!),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                // ID image
                if (user.idPicture != null && user.idPicture!.isNotEmpty)
                  CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle('صورة الهوية',
                            icon: Icons.insert_photo_outlined),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            user.idPicture!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const IdImagePlaceholder();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle('صورة الهوية',
                            icon: Icons.insert_photo_outlined),
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
                          onPressed: () {
                            // Navigate to CreateUserScreen with user argument for editing
                            Navigator.of(context).pushNamed(
                              Routes.createUser,
                              arguments: user,
                            );
                          },
                          icon: const Icon(Icons.autorenew_rounded, size: 18),
                          label: const Text('تحديث البيانات',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
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
                          onPressed: () {
                            // TODO: Implement delete user
                          },
                          icon: const Icon(Icons.delete_outline, size: 20),
                          label: const Text('حذف المستخدم',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE74C3C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
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

class _DefaultAvatar extends StatelessWidget {
  final double width;
  final double height;

  const _DefaultAvatar({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.person,
        size: 60,
        color: Colors.grey,
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
