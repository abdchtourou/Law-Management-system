import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lms/core/theming/styles.dart';

class LabeledImageSlot extends StatelessWidget {
  final String label;
  final File? file;
  final String? imageUrl;
  final VoidCallback onTap;

  const LabeledImageSlot({
    super.key,
    required this.label,
    this.file,
    this.imageUrl,
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
            child: _buildImageContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildImageContent() {
    if (file != null) {
      return Image.file(
        file!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => const Center(
          child: Icon(Icons.broken_image, color: Colors.grey),
        ),
      );
    } else {
      return const Center(
        child: Icon(
          Icons.image_outlined,
          size: 30,
          color: Color(0xFF9AA6B2),
        ),
      );
    }
  }
}
