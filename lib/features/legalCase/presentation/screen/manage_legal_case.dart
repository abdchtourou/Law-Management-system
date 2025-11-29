import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/constants/image_constants.dart';
import 'package:lms/core/theming/styles.dart';

import '../../../../core/theming/colorsManager.dart';
import 'case_details_screen.dart';

class CaseData {
  final int id;
  final String title;

  CaseData({required this.id, required this.title});
}
class CasesManagementScreen extends StatefulWidget {
  const CasesManagementScreen({super.key});

  @override
  State<CasesManagementScreen> createState() => _CasesManagementScreenState();
}

class _CasesManagementScreenState extends State<CasesManagementScreen> {
  final TextEditingController _search = TextEditingController();
  int page = 1;
  final int perPage = 10;

  late List<CaseData> all;
  bool _showCards = false;

  List<CaseData> _demo() => List.generate(
    40,
        (i) => CaseData(id: i + 1, title: 'عنوان القضية'),
  );

  @override
  void initState() {
    super.initState();
    all = _demo(); // TODO: replace with real data
  }

  @override
  Widget build(BuildContext context) {
    final q = _search.text.trim();
    final filtered = all
        .where((c) =>
    q.isEmpty || c.title.contains(q) || '#${c.id}'.contains(q))
        .toList();

    final pages = (filtered.length / perPage).ceil().clamp(1, 9999);
    page = page.clamp(1, pages);
    final start = (page - 1) * perPage;
    final end = (start + perPage).clamp(0, filtered.length);
    final items = filtered.sublist(start, end);
    void openCaseDetails(CaseData caseData) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CaseDetailsScreen(data: caseData),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: ColorsManager.accent),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Text(
              'إدارة القضايا',
              style: TextStyles.font16BlackBold,
            ),
            20.horizontalSpace,
          ]),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    12.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [

                          _FilterButton(onTap: (){
                            setState(() {
                              _showCards = !_showCards;
                            });
                          }),
                          10.horizontalSpace,

                          Expanded(
                            child: _SearchField(
                              controller: _search,
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: open add-case screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label:  Text(
                            'إضافة قضية',
                            style: TextStyles.font14WhiteBold,
                          ),
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    !_showCards ?  const _TableHeader(): const SizedBox.shrink(),
                    12.verticalSpace,
                    Expanded(
                      child: _showCards
                          ? ListView.separated(
                        padding: EdgeInsets.all(16.w),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => 12.verticalSpace,
                        itemBuilder: (context, index) {
                          final c = items[index];
                          return CaseDisplayCard(data: c,  onTap: () => openCaseDetails(c),); // 👈 card widget
                        },
                      )
                          : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final c = items[index];
                          return _CaseRow(caseData: c);
                        },
                      ),
                    ),

                    // Pagination footer
                   !_showCards? _PagerFooter(
                      page: page,
                      pages: pages,
                      onPrev:
                      page > 1 ? () => setState(() => page--) : null,
                      onNext:
                      page < pages ? () => setState(() => page++) : null,
                    ): const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.left,

      decoration: InputDecoration(
        hintText: '... Search',

        hintStyle: TextStyles.font16grey60Medium,
        prefixIcon:  Icon(Icons.search, size: 20.sp),
        isDense: false,
        contentPadding:
         EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color:  ColorsManager.grey30,
          ),
        ),


          child: SvgPicture.asset(filterSvg)),
    );
  }
}
class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        border: Border(
          top: BorderSide(color: Color(0xFFE5E7EB)),
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'id',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.unfold_more,
                    size: 18, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'العنوان',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _CaseRow extends StatelessWidget {
  const _CaseRow({required this.caseData});

  final CaseData caseData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${caseData.id}',
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              caseData.title,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _PagerFooter extends StatelessWidget {
  const _PagerFooter({
    required this.page,
    required this.pages,
    this.onPrev,
    this.onNext,
  });

  final int page;
  final int pages;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        children: [
          _CirclePagerButton(icon: Icons.chevron_left, onTap: onPrev),
          const Spacer(),
          Text(
            'Page $page of $pages',
            style: const TextStyle(
              color: Color(0xFF475569),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          _CirclePagerButton(icon: Icons.chevron_right, onTap: onNext),
        ],
      ),
    );
  }
}
class _CirclePagerButton extends StatelessWidget {
  const _CirclePagerButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Material(
      color: const Color(0xFFF3F5F7),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44.w,
          height: 44.h,
          child: Icon(
            icon,
            color:
            enabled ? const Color(0xFF111827) : const Color(0xFFCBD5E1),
          ),
        ),
      ),
    );
  }
}
class CaseFilterCard extends StatelessWidget {
  const CaseFilterCard({super.key, required this.data, required this.selected});

  final CaseData data;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
    selected ? const Color(0xFF9CA3AF) : const Color(0xFF111827);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE4ECF0),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: selected ? const Color(0xFFFF6B6B) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // icon area
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: const Color(0xFFD0DCE4),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: const Icon(Icons.assignment_outlined,
                size: 30, color: Color(0xFF1F2933)),
          ),
          12.horizontalSpace,
          // text area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                6.verticalSpace,
                _line('الجهة الرسمية :', 'محكمة الريف', textColor),
                _line('اسم الخصم :', 'محمد سعيد رمضان', textColor),
                _line('القرار :', 'تم الفصل', textColor),
                _line('الوصف :', 'تمت الموافقة على الطلب', textColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        '$label $value',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
class CaseDisplayCard extends StatelessWidget {
  const CaseDisplayCard({super.key, required this.data,required this.onTap});

  final CaseData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE4ECF0),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style:  TextStyles.font12BlackExtraBold,
                  ),
                  6.verticalSpace,
                  _caseLine('الجهة الرسمية :', 'محكمة الريف'),
                  _caseLine('اسم الموكل :', ' حمد كمال الدين'),
                  _caseLine('اسم الخصم :', 'محمد سعيد رمضان'),
                  Row(
                    children: [
                      _caseLine('القرار :', 'تم الفصل'),
                      20.horizontalSpace,
                      _caseLine('الفصل: :', 'تم الفصل'),
                    ],
                  ),
                  _caseLine('الوصف :', 'تمت الموافقة على الطلب'),
                ],
              ),
            ),

            12.horizontalSpace,

            // Icon column
            SvgPicture.asset(noteSvg),
          ],
        ),
      ),
    );

  }

  static Widget _caseLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2,top: 10),
      child: Text(
        '$label $value',
        textAlign: TextAlign.right,
        style:  TextStyles.font12BlackExtraBold.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
