import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../legalCase/presentation/widgets/user_drop_down.dart';
import '../cubit /createTask/create_task_cubit.dart';
import '../cubit /createTask/create_task_state.dart';
import '../cubit /taskType/task_type_state.dart';
import '../models/simple_user.dart';
import '../widgets/task_form_widgets.dart';

class CreateAdministrativeTaskScreen extends StatelessWidget {
  final List<SimpleUser> users;

  const CreateAdministrativeTaskScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTaskCubit(type: AdminTaskType.administrative),
      child: _CreateAdministrativeTaskView(users: users),
    );
  }
}

class _CreateAdministrativeTaskView extends StatelessWidget {
  final List<SimpleUser> users;

  const _CreateAdministrativeTaskView({required this.users});

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
        appBar: const TaskCreationAppBar(title: 'إنشاء مهمة إدارية'),
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
                    const TaskFormLabel('الموقع'),
                    TaskFormInput(
                      controller: cubit.locationController,
                      hint: 'محمد سعيد',
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('اخر موعد للتسليم'),
                    TaskFormInput(
                      initialValue: state.dueDate == null
                          ? ''
                          : formatTaskDate(state.dueDate!),
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
                    const TaskFormLabel('الوصف'),
                    Stack(
                      children: [
                        TaskFormInput(
                          controller: cubit.descriptionController,
                          hint: 'النص المقترح',
                          maxLines: 5,
                        ),
                        Positioned(
                          top: 10,
                          right: 12,
                          child: Text(
                            '${cubit.descriptionController.text.length}/200',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9AA6B2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    UsersDropDown(
                      label: 'مستخدمين',
                      hint: 'نص تلميحي',
                      items: users
                          .map((u) => UserDropDownItem(id: u.id, name: u.name))
                          .toList(),
                      value: state.selectedUserId,
                      onChanged: cubit.setSelectedUser,
                    ),
                    const SizedBox(height: 12),
                    const TaskFormLabel('ملاحظة/تنبيه'),
                    TaskFormInput(
                      controller: cubit.noteController,
                      hint: 'النص المقترح',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 22),
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
