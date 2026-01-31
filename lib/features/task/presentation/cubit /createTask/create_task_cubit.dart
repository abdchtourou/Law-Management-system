import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../taskType/task_type_state.dart';
import 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  // Controllers (requested)
  final titleController = TextEditingController();
  final locationController = TextEditingController(); // admin only
  final descriptionController = TextEditingController(); // both
  final noteController = TextEditingController(); // both (ملاحظة/تنبيه)
  final outSideUser = TextEditingController();

  CreateTaskCubit({required AdminTaskType type})
      : super(CreateTaskState(type: type)) {
    // trigger rebuild + validation on changes
    titleController.addListener(_onChange);
    locationController.addListener(_onChange);
    descriptionController.addListener(_onDescriptionChange);
    noteController.addListener(_onChange);
  }

  void _onChange() => emit(state.copyWith());

  void _onDescriptionChange() {
    // enforce 200 chars
    final t = descriptionController.text;
    if (t.length > 200) {
      final clipped = t.substring(0, 200);
      final oldSelection = descriptionController.selection;
      descriptionController.value = TextEditingValue(
        text: clipped,
        selection: TextSelection.collapsed(
          offset: oldSelection.baseOffset.clamp(0, clipped.length),
        ),
      );
    }
    emit(state.copyWith());
  }

  void setDueDate(DateTime? dt) => emit(state.copyWith(dueDate: dt));

  // Administrative
  void setSelectedUser(String? id) => emit(state.copyWith(selectedUserId: id));

  // Legal
  void setStatus(String? v) => emit(state.copyWith(status: v));
  void setInsideUser(String? id) => emit(state.copyWith(insideUserId: id));
  void setOutsideUser(String? id) => emit(state.copyWith(outsideUserId: id));

  bool get canSubmit {
    final titleOk = titleController.text.trim().isNotEmpty;
    final dateOk = state.dueDate != null;

    if (!titleOk || !dateOk) return false;

    if (state.isAdministrative) {
      final locOk = locationController.text.trim().isNotEmpty;
      final userOk = (state.selectedUserId ?? '').isNotEmpty;
      return locOk && userOk;
    }

    // legal:
    final statusOk = (state.status ?? '').isNotEmpty;
    final insideOk = (state.insideUserId ?? '').isNotEmpty;
    final outsideOk = (state.outsideUserId ?? '').isNotEmpty;
    return statusOk && insideOk && outsideOk;
  }

  Future<void> submit() async {
    if (!canSubmit || state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true));
    try {
      // TODO: call API here
      final payload = <String, dynamic>{
        "type": state.type.name,
        "title": titleController.text.trim(),
        "location": locationController.text.trim(),
        "description": descriptionController.text.trim(),
        "note": noteController.text.trim(),
        "due_date": state.dueDate?.toIso8601String(),
        "status": state.status,
        "selected_user_id": state.selectedUserId,
        "inside_user_id": state.insideUserId,
        "outside_user_id": state.outsideUserId,
      };
      debugPrint("SUBMIT: $payload");

      await Future.delayed(const Duration(milliseconds: 600));
    } finally {
      emit(state.copyWith(isSubmitting: false));
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    noteController.dispose();
    return super.close();
  }
}
