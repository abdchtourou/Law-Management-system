import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/theming/styles.dart';

class CreateLegalCaseScreen extends StatefulWidget {
  const CreateLegalCaseScreen({super.key});

  @override
  State<CreateLegalCaseScreen> createState() => _CreateLegalCaseScreenState();
}

class _CreateLegalCaseScreenState extends State<CreateLegalCaseScreen> {
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
              const UsersDropDown(label: 'الجهة الرسمية',),
              gap(),
              const UsersDropDown(label: 'اسم الموكل',),
              gap(),
              _Labeled('رقم الاساس', child: TextField(decoration: deco('يوم/شهر/سنة'))),
              gap(),
              const UsersDropDown(label: 'اسم الخصم',),

              gap(),
              const UsersDropDown(label: ' اسماء المحامين',),

              gap(),
              _Labeled('قرار الفصل', child: TextField(decoration: deco('سوريا'))),
              gap(),
              _Labeled('تاريخ الفصل', child: TextField(decoration: deco('يوم/شهر/سنة'))),
              gap(16),
              const DescriptionField(),
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


class UsersDropDown extends StatefulWidget {
  const UsersDropDown({super.key, required this.label});
  final String label ;


  @override
  State<UsersDropDown> createState() => _UsersDropDownState();
}

class _UsersDropDownState extends State<UsersDropDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  bool _isExpanded = false;
  int? _selectedIndex;
  final int itemsCount = 8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,


      children: [
        Text(widget.label,
            style: TextStyles.font14BlackBold),
        10.verticalSpace,
        // ================== الهيدر ==================
        GestureDetector(
          onTap: _toggle,
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFDBE1EA), width: 1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                 Text(
                  'نص تنبيهي',
                  style: TextStyles.font12AccentMedium,
                ),
                const Spacer(),

                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0.0, // دوران 180°
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),

        // مسافة صغيرة مع أنيميشن شفافية
        SizeTransition(
          sizeFactor: _expandAnimation,
          axisAlignment: -1.0,
          child: FadeTransition(
            opacity: _expandAnimation,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: _buildDropdownBody(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDBE1EA), width: 1),
      ),
      child: SizedBox(
        height: 260,
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: itemsCount + 1, // +1 لزر إضافة مستخدم
            itemBuilder: (context, index) {
              // أول عنصر = زر إضافة مستخدم
              if (index == 0) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      // TODO: اكشن إضافة مستخدم
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6FA),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'إضافة مستخدم',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              // باقي العناصر = "اختيار"
              final itemIndex = index - 1;
              final isSelected = itemIndex == _selectedIndex;

              return InkWell(
                onTap: () => setState(() => _selectedIndex = itemIndex),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    children: [
                      const Text(
                        'إختيار',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),

                      if (isSelected)
                        const Icon(Icons.check, size: 18)
                      else
                        const SizedBox(width: 18),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



class DescriptionField extends StatefulWidget {
  const DescriptionField({super.key});

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _controller = TextEditingController();
  final int _maxLength = 200;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Arabic
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxHeight: 200, // force TextField height
            ),
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top, // <<< ADD THIS
              maxLength: _maxLength,
              buildCounter: (_, {required currentLength, maxLength, required isFocused}) =>
              const SizedBox.shrink(),
              decoration: InputDecoration(
                hintText: "النص المقترح",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D6DC)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D6DC)),
                ),
              ),
              onChanged: (_) => setState(() {}),
            )
            ,
          ),

          // counter top-left
          Positioned(
            top: 10,
            left: 12,
            child: Text(
              '$_maxLength/${_controller.text.length}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
