import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../../../../core/widgets/labled_dropdown.dart';
import '../../../../core/widgets/labled_image_slot.dart';
import '../../../legalCase/presentation/widgets/description_field.dart';


class CreateClientScreen extends StatefulWidget {
  const CreateClientScreen({super.key});

  @override
  State<CreateClientScreen> createState() => _CreateClientScreenState();
}

class _CreateClientScreenState extends State<CreateClientScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _profileImage;
  File? _idImage;

  Future<void> _pickImage({required bool isProfile}) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('المعرض'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('الكاميرا'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;

    final xFile = await _picker.pickImage(source: source, imageQuality: 85);
    if (xFile == null) return;

    setState(() {
      if (isProfile) {
        _profileImage = File(xFile.path);
      } else {
        _idImage = File(xFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget gap([double h = 12]) => SizedBox(height: h.h);

    return Scaffold(
      appBar: const CustomAppBar(title: 'إنشاء عميل',),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LabeledFakeDropdown(
                label: 'النوع',
                value: 'شخص - شركة ',
              ),
              gap(),
              const LabeledTextField(
                label: ' الوكالة',
                hint: 'محمد سعيد',
              ),
              gap(),

              const LabeledTextField(
                label: 'اسم الوكالة',
                hint: 'محمد سعيد',
              ),
              gap(),
              const LabeledTextField(
                label: 'اسم الأب',
                hint: 'محمد سعيد',
              ),
              gap(),
              const LabeledTextField(
                label: 'اسم الأم',
                hint: 'محمد سعيد',
              ),
              gap(),
              const LabeledTextField(
                label: 'التولد',
                hint: 'يوم/شهر/سنة',
              ),
              gap(),
              const LabeledTextField(
                label: 'العنوان',
                hint: 'دمشق',
              ),
              gap(),
              const LabeledTextField(
                label: 'الرقم الوطني',
                hint: '956513513515',
                keyboardType: TextInputType.number,
              ),

              gap(),
              const LabeledTextField(
                label: 'رقم تواصل 1',
                hint: '956513513515',
                keyboardType: TextInputType.phone,
              ),

              gap(),
              const LabeledTextField(
                label: 'البريد الالكتروني',
                hint: 'example@email.com',
                keyboardType: TextInputType.emailAddress,
              ),


              gap(16),
              LabeledImageSlot(
                label: 'صورة شخصية',
                file: _profileImage,
                onTap: () => _pickImage(isProfile: true),
              ),
              gap(16),
              LabeledImageSlot(
                label: 'صورة الهوية',
                file: _idImage,
                onTap: () => _pickImage(isProfile: false),
              ),
              gap(16),
              LabeledImageSlot(
                label: ' صورة جواز سفر (اختياري)',
                file: _idImage,
                onTap: () => _pickImage(isProfile: false),
              ),
              gap(),
              const DescriptionField(),
              gap(24),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: send form
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.person_add_alt_1, size: 18),
                    label: const Text(
                      'إنشاء مستخدم',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
