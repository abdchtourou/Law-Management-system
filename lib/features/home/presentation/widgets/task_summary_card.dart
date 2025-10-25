import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.total,
    required this.progress, // 0.0 .. 1.0
    this.title = 'إجمالي المهام',
    this.subtitle = 'نسبة الانجاز',
    this.icon,
    this.color = const Color(0xFF245A78),
  });

  final int total;
  final double progress;
  final String title;
  final String subtitle;
  final Widget? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textDir = Directionality.of(context);
    return Directionality(
      textDirection: textDir,
      child: Container(
        width: 190.w,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon ??
                    const Icon(
                      Icons.description_outlined,
                      size: 40,
                      color: Colors.black87,
                    ),
                const SizedBox(width: 1),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      10.verticalSpace,
                      Text(
                        '$title : $total',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.end,
                      ),
                       SizedBox(height: 12.h),
                      Text(
                        subtitle,
                        style:  TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF6B8796),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            _SemiGauge(
              progress: progress.clamp(0.0, 1.0),
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}

class _SemiGauge extends StatelessWidget {
  const _SemiGauge({
    required this.progress,
    required this.color,
  });

  final double progress; // 0..1
  final Color color;

  @override
  Widget build(BuildContext context) {
    const double stroke = 6;
    const double gaugeWidth = 100;
    const double gaugeHeight = 30;


    return Container(

   // حجم الويدجت = حجم الرسمة بالضبط
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: const Size(gaugeWidth, gaugeHeight),
            painter: _SemiGaugePainter(
              progress: progress,
              color: color,
              strokeWidth: stroke,
              bgColor: const Color(0xFFEFF3F6),
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff1E293B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SemiGaugePainter extends CustomPainter {
  _SemiGaugePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
    required this.bgColor,
  });

  final double progress;
  final Color color;
  final double strokeWidth;
  final Color bgColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height); // قاع الصندوق
    final radius = math.min(100.w, 60.h) / 2 - strokeWidth / 2;

    const startAngle = math.pi;
    const sweep = math.pi;

    final paintBg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = strokeWidth
      ..color = bgColor;

    final paintFg = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = strokeWidth
      ..color = color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweep,
      false,
      paintBg,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweep * progress,
      false,
      paintFg,
    );
  }

  @override
  bool shouldRepaint(_SemiGaugePainter old) =>
      old.progress != progress ||
          old.color != color ||
          old.strokeWidth != strokeWidth ||
          old.bgColor != bgColor;
}

