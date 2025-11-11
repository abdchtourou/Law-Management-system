import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final IconData icon;

  const SectionTitle(this.text, {required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF6B7280)),
        const SizedBox(width: 6),
        Text(text,
            style: const TextStyle(color: Color(0xFF374151), fontSize: 13.5, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
