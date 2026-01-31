import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

/// Item for [UsersDropDown]. Use [id] as value and [name] for display.
class UserDropDownItem {
  final String id;
  final String name;
  const UserDropDownItem({required this.id, required this.name});
}

class UsersDropDown extends StatefulWidget {
  const UsersDropDown({
    super.key,
    required this.label,
    this.items = const [],
    this.value,
    this.onChanged,
    this.hint = 'نص تلميحي',
    this.showAddButton = false,
  });

  final String label;
  final List<UserDropDownItem> items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final String hint;
  final bool showAddButton;

  @override
  State<UsersDropDown> createState() => _UsersDropDownState();
}

class _UsersDropDownState extends State<UsersDropDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late final ScrollController _scrollController;

  bool _isExpanded = false;
  int? _selectedIndex;

  int get _selectedIndexFromValue {
    if (widget.value == null || widget.items.isEmpty) return -1;
    final i = widget.items.indexWhere((e) => e.id == widget.value);
    return i >= 0 ? i : -1;
  }

  @override
  void initState() {
    super.initState();
    final idx = _selectedIndexFromValue;
    _selectedIndex = idx >= 0 ? idx : null;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(UsersDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value || oldWidget.items != widget.items) {
      final idx = _selectedIndexFromValue;
      _selectedIndex = idx >= 0 ? idx : null;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
        Text(widget.label, style: TextStyles.font14BlackBold),
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
                  _selectedIndex != null &&
                          _selectedIndex! >= 0 &&
                          _selectedIndex! < widget.items.length
                      ? widget.items[_selectedIndex!].name
                      : widget.hint,
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
    final itemCount = widget.items.length + (widget.showAddButton ? 1 : 0);
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
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (widget.showAddButton && index == 0) {
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

              final itemIndex = widget.showAddButton ? index - 1 : index;
              final isSelected = itemIndex == _selectedIndex;
              final item = widget.items[itemIndex];

              return InkWell(
                onTap: () {
                  setState(() => _selectedIndex = itemIndex);
                  widget.onChanged?.call(item.id);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
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
