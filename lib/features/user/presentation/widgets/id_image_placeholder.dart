import 'package:flutter/material.dart';

class IdImagePlaceholder extends StatelessWidget {
  const IdImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE3E6EA)),
      ),
      child: const Center(
        child: Icon(Icons.badge_outlined, size: 60, color: Color(0xFF95A1AC)),
      ),
    );
  }
}
