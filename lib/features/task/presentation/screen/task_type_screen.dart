import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/core/constants/image_constants.dart';
import 'package:lms/core/theming/colorsManager.dart';
import 'package:lms/features/task/presentation/cubit%20/taskType/task_type_state.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../cubit /taskType/task_type_cubit.dart';
import '../models/simple_user.dart';
import 'create_administrative_task_screen.dart';
import 'create_legal_task_screen.dart';
import 'create_task_screen.dart';

class TaskTypeScreen extends StatelessWidget {
  const TaskTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = const [
      SimpleUser(id: '1', name: 'محمد سعيد'),
      SimpleUser(id: '2', name: 'نور'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: CustomAppBar(
        title: 'إنشاء مهمة',
      ),
      body: SafeArea(
        child: BlocBuilder<TaskTypeCubit, TaskTypeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  const Spacer(),
                  _TaskTypeCard(
                    title: 'مهمة قانونية',
                    icon: Icons.description_outlined,
                    isSelected: state.selectedType == AdminTaskType.legal,
                    onTap: () => context.read<TaskTypeCubit>().select(AdminTaskType.legal),
                  ),
                  const SizedBox(height: 18),
                  _TaskTypeCard(
                    title: 'مهمة إدارية',
                    icon: Icons.description_outlined,
                    isSelected: state.selectedType == AdminTaskType.administrative,
                    onTap: () => context.read<TaskTypeCubit>().select(AdminTaskType.administrative),
                  ),
                  const Spacer(),
                  _NextButton(
                    enabled: state.canContinue,
                    onPressed: () {
                      final type = state.selectedType;

                      if (type == null) return;

                            type != AdminTaskType.legal ?  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CreateAdministrativeTaskScreen(users: users),
                              ),
                            ) :   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    CreateLegalTaskScreen(insideUsers: users,outsideUsers: users,),
                              ),
                            );

                    },
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TaskTypeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TaskTypeCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? const Color(0xFF0B6F8A) : const Color(0xFFD7D7D7);

    final iconColor = isSelected ? const Color(0xFF0B6F8A) : const Color(0xFF9A9A9A);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                descriptionFileSvg,
                color: isSelected ? ColorsManager.secondary : ColorsManager.grey700,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyles.font28BlackExtraBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const _NextButton({
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 56,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          disabledBackgroundColor: Colors.black.withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
      ),
    );
  }
}
