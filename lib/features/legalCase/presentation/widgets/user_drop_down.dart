
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

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
