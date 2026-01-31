import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../legalCase/presentation/widgets/description_field.dart';
import '../../../legalCase/presentation/widgets/user_drop_down.dart';
import '../cubit /createTask/create_task_cubit.dart';
import '../cubit /createTask/create_task_state.dart';
import '../cubit /taskType/task_type_state.dart';
import '../models/simple_user.dart';
import '../widgets/task_form_widgets.dart';

class CreateLegalTaskScreen extends StatelessWidget {
  final List<SimpleUser> insideUsers;
  final List<SimpleUser> outsideUsers;
  final List<String> statuses;

  const CreateLegalTaskScreen({
    super.key,
    required this.insideUsers,
    required this.outsideUsers,
    this.statuses = const ['قيد المراجعة', 'قيد التنفيذ', 'مكتملة', 'مؤجلة'],
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTaskCubit(type: AdminTaskType.legal),
      child: _CreateLegalTaskView(
        insideUsers: insideUsers,
        outsideUsers: outsideUsers,
        statuses: statuses,
      ),
    );
  }
}

class _CreateLegalTaskView extends StatelessWidget {
  final List<SimpleUser> insideUsers;
  final List<SimpleUser> outsideUsers;
  final List<String> statuses;

  const _CreateLegalTaskView({
    required this.insideUsers,
    required this.outsideUsers,
    required this.statuses,
  });

  Future<void> _pickDate(BuildContext context, CreateTaskCubit cubit) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      initialDate: cubit.state.dueDate ?? now,
    );
    if (picked != null) cubit.setDueDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: const TaskCreationAppBar(title: 'إنشاء مهمة قانونية'),
        body: SafeArea(
          child: BlocBuilder<CreateTaskCubit, CreateTaskState>(
            builder: (context, state) {
              final cubit = context.read<CreateTaskCubit>();

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TaskFormLabel('عنوان'),
                    TaskFormInput(
                      controller: cubit.titleController,
                      hint: 'محمد سعيد',
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('الوصف'),
                    DescriptionField(controller: cubit.descriptionController),
                    const SizedBox(height: 12),
                    UsersDropDown(
                      label: 'الحالة',
                      hint: 'نص تلميحي',
                      items: statuses.map((s) => UserDropDownItem(id: s, name: s)).toList(),
                      value: state.status,
                      onChanged: cubit.setStatus,
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('اخر موعد للتسليم'),
                    TaskFormInput(
                      initialValue: state.dueDate == null ? '' : formatTaskDate(state.dueDate!),
                      hint: 'يوم-شهر-سنة',
                      readOnly: true,
                      onTap: () => _pickDate(context, cubit),
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: Color(0xFF6B7785),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('ملاحظة/تنبيه'),
                    TaskFormInput(
                      controller: cubit.noteController,
                      hint: 'النص المقترح',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 12),
                    UsersDropDown(
                      label: 'مستخدمين (من النظام)',
                      hint: 'نص تلميحي',
                      items: insideUsers.map((u) => UserDropDownItem(id: u.id, name: u.name)).toList(),
                      value: state.insideUserId,
                      onChanged: cubit.setInsideUser,
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('مستخدمين (من خارج النظام)'),
                    TaskFormInput(
                      controller: cubit.outSideUser,
                      hint: ' الاسم',
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('ملفات'),
                    AttachmentsBox(
                      onTap: () {

                      },
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: TaskPrimaryButton(
                        text: 'إنشاء مهمة',
                        enabled: cubit.canSubmit,
                        loading: state.isSubmitting,
                        onPressed: () async {
                          await cubit.submit();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم إنشاء المهمة')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
