import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/theming/styles.dart';

import '../../../../core/widgets/labled_image_slot.dart';
import '../widgets/description_field.dart';
import '../widgets/user_drop_down.dart';

class CreateLegalCaseScreen extends StatefulWidget {
  const CreateLegalCaseScreen({super.key});

  @override
  State<CreateLegalCaseScreen> createState() => _CreateLegalCaseScreenState();
}

class _CreateLegalCaseScreenState extends State<CreateLegalCaseScreen> {
  late final TextEditingController _outsideUserController;
  final ImagePicker _imagePicker = ImagePicker();
  File? _attachmentFile;

  @override
  void initState() {
    super.initState();
    _outsideUserController = TextEditingController();
  }

  @override
  void dispose() {
    _outsideUserController.dispose();
    super.dispose();
  }

  Future<void> _showAttachmentPicker() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('اختيار من المعرض'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('التقاط صورة'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    final picked = await _imagePicker.pickImage(source: source, imageQuality: 85);
    if (picked != null) {
      setState(() => _attachmentFile = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F6F7);
    const fieldBorder = Color(0xFFE1E5E8);
    const titleColor = Color(0xFF343A40);
    const hintColor = Color(0xFF98A2AB);

    InputDecoration deco(String hint) => InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: hintColor, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: fieldBorder, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: fieldBorder, width: 1.2),
          ),
          filled: true,
          fillColor: Colors.white,
        );

    Widget gap([double h = 12]) => SizedBox(height: h);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '  إنشاء قضية',
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _Labeled(' المعرف ( رقم القضية )', child: TextField(decoration: deco('محمد سعيد'))),
              gap(),
              const UsersDropDown(label: 'الجهة الرسمية',showAddButton: true,),
              gap(),
              const UsersDropDown(label: 'اسم الموكل',showAddButton: true,),
              gap(),
              _Labeled('رقم الاساس', child: TextField(decoration: deco('يوم/شهر/سنة'))),
              gap(),
              const UsersDropDown(label: 'اسم الخصم',),

              gap(),
              const UsersDropDown(label: ' اسماء المحامين',),

              gap(),
              _Labeled(
                'مستخدمين (من خارج النظام)',
                child: TextField(
                  controller: _outsideUserController,
                  decoration: deco('اكتب اسم المستخدم'),
                ),
              ),

              gap(),
              _Labeled('قرار الفصل', child: TextField(decoration: deco('سوريا'))),
              gap(),
              _Labeled('تاريخ الفصل', child: TextField(decoration: deco('يوم/شهر/سنة'))),
              gap(16),
               DescriptionField(controller: TextEditingController(),),
              gap(16),
              LabeledImageSlot(
                label: 'المرفقات',
                file: _attachmentFile,
                onTap: _showAttachmentPicker,
              ),
              gap(16),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 44,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.autorenew_rounded, size: 18),
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

class _Labeled extends StatelessWidget {
  final String label;
  final Widget child;

  const _Labeled(this.label, {required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyles.font14BlackBold),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

