import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/constants/image_constants.dart';

class CasesSummaryCard extends StatelessWidget {
  const CasesSummaryCard({
    super.key,
    required this.total,
    required this.openCount,
    required this.closedCount,
    required this.inProgressCount,
  });

  final int total;
  final int openCount;
  final int closedCount;
  final int inProgressCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
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
              SvgPicture.asset(lawIconSvg),
              const SizedBox(width: 1),
              Expanded(
                child: Text(
                  'إجمالي القضايا: $total',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const _StatusLabel(text: 'مفتوحة'),
              10.horizontalSpace,
              const _StatusLabel(text: 'مغلقة'),
              15.horizontalSpace,
              const _StatusLabel(text: 'قيد الانجاز'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Badge(count: inProgressCount, color: const Color(0xFF6B6F74)),
              _Badge(count: closedCount, color: const Color(0xFF0E2A3D)),
              _Badge(count: openCount, color: const Color(0xFF3F525D)),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusLabel extends StatelessWidget {
  const _StatusLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF6B8796), // رمادي مزرق
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.count, required this.color});

  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36.w,
      height: 33.h,
      child: CustomPaint(
        painter: _BadgePainter(
          fill: color,
          shadow: const BoxShadow(
            color: Color(0x22000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              '$count',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BadgePainter extends CustomPainter {
  _BadgePainter({required this.fill, this.shadow});

  final Color fill;
  final BoxShadow? shadow;

  @override
  @override
  void paint(Canvas canvas, Size size) {
    final double r = 10.0.r;
    final double topR = 10.0.r;
    final double tipW = 14.0.w;
    final double tipH = 8.0.h;

    final extra = 4.0.h;
    final rect = Rect.fromLTWH(0, tipH, size.width, size.height - tipH + extra);

    final path = Path()
      ..moveTo(rect.left + topR, rect.top)
      ..lineTo(rect.right - topR, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + topR),
        radius: const Radius.circular(10),
      )
      ..lineTo(rect.right, rect.bottom - r)
      ..arcToPoint(
        Offset(rect.right - r, rect.bottom),
        radius: const Radius.circular(10),
      )
      ..lineTo(rect.left + r, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - r),
        radius: const Radius.circular(10),
      )
      ..lineTo(rect.left, rect.top + topR)
      ..arcToPoint(
        Offset(rect.left + topR, rect.top),
        radius: const Radius.circular(10),
      )
      ..lineTo(rect.left + (rect.width - tipW) / 2, rect.top)
      ..lineTo(rect.left + rect.width / 2, 0)
      ..lineTo(rect.left + (rect.width + tipW) / 2, rect.top)

      // إغلاق الشكل
      ..close();

    // رسم الظل البسيط إن وجد
    if (shadow != null) {
      final paintShadow = Paint()
        ..color = shadow!.color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow!.blurRadius);
      canvas.save();
      canvas.translate(shadow!.offset.dx, shadow!.offset.dy);
      canvas.drawPath(path, paintShadow);
      canvas.restore();
    }

    final paintFill = Paint()..color = fill;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant _BadgePainter oldDelegate) =>
      oldDelegate.fill != fill || oldDelegate.shadow != shadow;
}
