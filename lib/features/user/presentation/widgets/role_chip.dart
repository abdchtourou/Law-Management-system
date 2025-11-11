import 'package:flutter/material.dart';

class RoleChip extends StatelessWidget {
  final String label;

  const RoleChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 4),
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF3F6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE3E6EA)),
      ),
      child: Center(
        child: Text(label,
            style: const TextStyle(color: Color(0xFF5B6B77), fontSize: 13, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
