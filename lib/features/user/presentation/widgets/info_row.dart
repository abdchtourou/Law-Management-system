import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(color: Color(0xFF6B7280), fontSize: 13, height: 1.2);
    const valueStyle = TextStyle(color: Color(0xFF111827), fontSize: 14, fontWeight: FontWeight.w600);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF6B7280)),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$label :', style: labelStyle),
              const SizedBox(height: 2),
              Text(value, style: valueStyle),
            ],
          ),
        ),
      ],
    );
  }
}
