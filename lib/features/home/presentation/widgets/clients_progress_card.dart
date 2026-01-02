import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_localizations.dart';

const _blue = Color(0xFF2C617B); // الأزرق الداكن بالشكل
const _barBg = Color(0xFFD3DBE0); // خلفية شريط التقدم
const _labelGrey = Color(0xFF6B8796);

class ClientsProgressCard extends StatelessWidget {
  const ClientsProgressCard({
    super.key,
    required this.total,
    required this.maleRatio, // 0..1 (نسبة الذكور)
  });

  final int total;
  final double maleRatio;

  @override
  Widget build(BuildContext context) {
    final pct = (maleRatio.clamp(0, 1) * 100).round();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 360.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.translate('clientsCount')}: $total',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.1,
                  ),
                ),
                12.w.horizontalSpace,
                Icon(Icons.groups_outlined, size: 32.r, color: _blue),
              ],
            ),
            14.h.verticalSpace,
            _PillProgress(
              value: maleRatio,
              height: 16.h,
              bgColor: _barBg,
              fillColor: _blue,
              label: '$pct%',
            ),
            10.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GenderLabel(
                    text: AppLocalizations.of(context)!.translate('female'),
                    active: false),
                _GenderLabel(
                    text: AppLocalizations.of(context)!.translate('male'),
                    active: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PillProgress extends StatelessWidget {
  const _PillProgress({
    required this.value,
    required this.height,
    required this.bgColor,
    required this.fillColor,
    this.label,
  });

  final double value; // 0..1
  final double height;
  final Color bgColor;
  final Color fillColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0, 1);
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final fillW = w * v;
        final radius = Radius.circular(height / 2);

        return Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(radius),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: height,
              width: fillW,
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.all(radius),
              ),
            ),
            // النص داخل الكبسولة، محاذي يمين داخل الجزء المعبأ
            Positioned(
              right: 8,
              child: Text(
                label ?? '',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GenderLabel extends StatelessWidget {
  const _GenderLabel({required this.text, required this.active});
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: _labelGrey,
          ),
        ),
        6.w.horizontalSpace,
        Container(
          width: 7.r,
          height: 6.r,
          decoration: BoxDecoration(
            color: active ? _blue : Colors.transparent,
            border: Border.all(color: active ? _blue : _barBg, width: 2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
