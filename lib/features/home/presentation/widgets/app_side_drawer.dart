import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/routing/routes.dart';
import 'package:lms/core/theming/styles.dart';
import 'package:lms/core/utils/extensions.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/LocaleCubit.dart';
import '../../../../core/utils/app_localizations.dart';
import '../../../../core/constants/image_constants.dart';

class AppSideDrawer extends StatelessWidget {
  const AppSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const grey = Color(0xFF6B7280);
    const cardBorder = Color(0xFFE6E8EA);
    const cardBg = Color(0xFFF8FAFB);

    return Drawer(
      width: 320,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 18),
            children: [
              // Header (avatar + name + role)
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=8'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Azunyan U. Wu',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          AppLocalizations.of(context)!
                              .translate('basicMember'),
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.wb_sunny_outlined, color: grey),
                  // Language Switcher
                  IconButton(
                    icon: const Icon(Icons.language, color: grey),
                    onPressed: () {
                      final currentLocale = Localizations.localeOf(context);
                      if (currentLocale.languageCode == 'ar') {
                        context.read<LocaleCubit>().setEnglish();
                      } else {
                        context.read<LocaleCubit>().setArabic();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .translate('searchPlaceholder'),
                  suffixIcon: const Icon(Icons.search, color: grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: cardBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: cardBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                ),
              ),

              const SizedBox(height: 18),
              _SectionTitle(
                  AppLocalizations.of(context)!.translate('userSection')),
              _SectionCard(
                children: [
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('createNewUser'),
                      icon: personAddSvg,
                      onTap: () {
                        context.pushNamed(Routes.createUser);
                      }),
                  _LineItem(
                    title: AppLocalizations.of(context)!
                        .translate('userManagement'),
                    icon: groupSvg,
                    onTap: () {
                      context.pushNamed(Routes.userManagement);
                    },
                  ),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('createClient'),
                      icon: personAddSvg,
                      onTap: () {
                        context.pushNamed(Routes.createClient);
                      }),
                ],
              ),

              const SizedBox(height: 16),
              _SectionTitle(
                  AppLocalizations.of(context)!.translate('caseSection')),
              _SectionCard(
                children: [
                  _LineItem(
                    title: AppLocalizations.of(context)!
                        .translate('createLegalCase'),
                    icon: gavelSvg,
                    onTap: () {
                      context.pushNamed(Routes.createLegalCase);
                    },
                  ),
                  _LineItem(
                    title: AppLocalizations.of(context)!
                        .translate('manageLegalCases'),
                    icon: factCheckSvg,
                    onTap: () {
                      context.pushNamed(Routes.legalCaseManagement);
                    },
                  ),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('createTaskTypes'),
                      icon: folderOpenSvg),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('assignTasks'),
                      icon: eventNoteSvg),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('approveTasks'),
                      icon: trueMarkSvg),
                ],
              ),

              const SizedBox(height: 16),
              _SectionTitle(
                  AppLocalizations.of(context)!.translate('agencySection')),
              _SectionCard(
                children: [
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('createAgency'),
                      icon: icon1Svg),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('manageAgency'),
                      icon: factCheckSvg),
                ],
              ),

              const SizedBox(height: 16),
              _SectionTitle(
                  AppLocalizations.of(context)!.translate('docsSection')),
              _SectionCard(
                children: [
                  _LineItem(
                      title:
                          AppLocalizations.of(context)!.translate('caseFiles'),
                      icon: factCheckSvg),
                  _LineItem(
                      title:
                          AppLocalizations.of(context)!.translate('taskFiles'),
                      icon: factCheckSvg),
                  _LineItem(
                      title: AppLocalizations.of(context)!
                          .translate('agencyFiles'),
                      icon: factCheckSvg),
                  _LineItem(
                      title:
                          AppLocalizations.of(context)!.translate('otherFiles'),
                      icon: icon2Svg),
                ],
              ),

              const SizedBox(height: 16),
              // Calendar single tile
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: const Icon(Icons.calendar_month_outlined, color: grey),
                title: Text(
                  AppLocalizations.of(context)!.translate('calendar'),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800),
                ),
                onTap: () {},
              ),

              const SizedBox(height: 16),
              // Logout big button
              Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: cardBorder),
                ),
                padding: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.black87),
                  label: Text(
                    AppLocalizations.of(context)!.translate('logout'),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  onPressed: () {
                    // TODO: handle logout
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---- helpers ----

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6, bottom: 8),
      child: Text(text, style: TextStyles.font16BlackExtraBold),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE6E8EA)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            if (i != 0) const Divider(height: 1, color: Color(0xFFEAECEF)),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _LineItem extends StatelessWidget {
  const _LineItem({required this.title, required this.icon, this.onTap});

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      minVerticalPadding: 12,
      horizontalTitleGap: 3.w,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: SvgPicture.asset(icon),
      title: Text(title, style: TextStyles.font10BlackBold),
    );
  }
}
