import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lms/core/theming/styles.dart';

class LabeledImageSlot extends StatelessWidget {
  final String label;
  final File? file;
  final VoidCallback onTap;

  const LabeledImageSlot({
    super.key,
    required this.label,
    required this.file,
    required this.onTap,
  });

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
              child: Icon(
                Icons.image_outlined,
                size: 30,
                color: Color(0xFF9AA6B2),
              ),
            )
                : Image.file(
              file!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
