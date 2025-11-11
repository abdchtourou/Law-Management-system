import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
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
          'إنشاء مستخدم جديد',
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
              _Labeled('اسم الموظف', child: TextField(decoration: deco('محمد سعيد'))),
              gap(),
              _Labeled('اسم الأب', child: TextField(decoration: deco('محمد سعيد'))),
              gap(),
              _Labeled('اسم الأم', child: TextField(decoration: deco('محمد سعيد'))),
              gap(),
              _Labeled('التولد', child: TextField(decoration: deco('يوم/شهر/سنة'))),
              gap(),
              _Labeled('العنوان', child: TextField(decoration: deco('دمشق'))),
              gap(),
              _Labeled('الرقم الوطني', child: TextField(decoration: deco('956513513515'))),
              gap(),
              _Labeled('الدولة', child: TextField(decoration: deco('سوريا'))),
              gap(),
              _Labeled('المحافظة', child: TextField(decoration: deco('دمشق'))),
              gap(),
              _Labeled('رقم تواصل 1', child: TextField(decoration: deco('956513513515'))),
              gap(),
              _Labeled('رقم تواصل 2', child: TextField(decoration: deco('956513513515'))),
              gap(),
              _Labeled('البريد الالكتروني', child: TextField(decoration: deco('example@email.com'))),
              gap(),
              _Labeled(
                'الدور',
                child: _FakeDropdownField(
                  label: 'نص تجريبي',
                  decoration: deco('نص تجريبي').copyWith(
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: hintColor),
                  ),
                ),
              ),
              gap(16),
              const _LabelOnly('صورة شخصية'),
              gap(6),
              _ImageSlot(
                file: _profileImage,
                onTap: () => _pickImage(isProfile: true),
              ),
              gap(16),
              const _LabelOnly('صورة الهوية'),
              gap(6),
              _ImageSlot(
                file: _idImage,
                onTap: () => _pickImage(isProfile: false),
              ),
              gap(24),
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
            style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

class _LabelOnly extends StatelessWidget {
  final String label;

  const _LabelOnly(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13, fontWeight: FontWeight.w600));
  }
}

/// Dropdown شكلي فقط
class _FakeDropdownField extends StatelessWidget {
  final String label;
  final InputDecoration decoration;

  const _FakeDropdownField({required this.label, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: decoration,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(label, style: const TextStyle(color: Color(0xFF111827), fontSize: 14)),
      ),
    );
  }
}

/// صندوق الصورة – يفتح الكاميرا/المعرض ويعرض المعاينة
class _ImageSlot extends StatelessWidget {
  final File? file;
  final VoidCallback onTap;

  const _ImageSlot({required this.file, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 92,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE1E5E8)),
          borderRadius: BorderRadius.circular(6),
        ),
        clipBehavior: Clip.hardEdge,
        child: file == null
            ? const Center(
                child: Icon(Icons.image_outlined, size: 30, color: Color(0xFF9AA6B2)),
              )
            : Image.file(file!, fit: BoxFit.cover, width: double.infinity),
      ),
    );
  }
}
