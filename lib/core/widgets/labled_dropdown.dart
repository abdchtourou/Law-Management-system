import 'package:flutter/material.dart';

import '../theming/colorsManager.dart';
import '../theming/styles.dart';

class LabeledFakeDropdown extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const LabeledFakeDropdown({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  InputDecoration _deco() {
    return InputDecoration(
      hintText: value,
      hintStyle: const TextStyle(color: Color(0xFF98A2AB), fontSize: 14),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color:  ColorsManager.accent, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.black, width: 1.2),
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xFF98A2AB),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font14BlackBold,
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: InputDecorator(
            decoration: _deco(),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
