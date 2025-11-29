import 'package:flutter/material.dart';

class LogRow extends StatelessWidget {
  final String time;
  final String date;

  const LogRow({super.key, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    const label = TextStyle(color: Color(0xFF6B7280), fontSize: 13);
    const value = TextStyle(color: Color(0xFF111827), fontSize: 14, fontWeight: FontWeight.w600);

    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF6B7280)),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            children: [
              const Text('الساعة : ', style: label),
              Text(time, style: value),
              const Spacer(),
              Text(date, style: value),
            ],
          ),
        ),
      ],
    );
  }
}
