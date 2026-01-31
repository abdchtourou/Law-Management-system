import 'package:equatable/equatable.dart';

import '../taskType/task_type_state.dart';
class CreateTaskState extends Equatable {
  final AdminTaskType type;

  // Non-text fields
  final DateTime? dueDate;
  final String? status; // legal
  final String? selectedUserId; // administrative
  final String? insideUserId; // legal
  final String? outsideUserId; // legal

  final bool isSubmitting;

  const CreateTaskState({
    required this.type,
    this.dueDate,
    this.status,
    this.selectedUserId,
    this.insideUserId,
    this.outsideUserId,
    this.isSubmitting = false,
  });

  bool get isLegal => type == AdminTaskType.legal;
  bool get isAdministrative => type == AdminTaskType.administrative;

  CreateTaskState copyWith({
    DateTime? dueDate,
    String? status,
    String? selectedUserId,
    String? insideUserId,
    String? outsideUserId,
    bool? isSubmitting,
  }) {
    return CreateTaskState(
      type: type,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      selectedUserId: selectedUserId ?? this.selectedUserId,
      insideUserId: insideUserId ?? this.insideUserId,
      outsideUserId: outsideUserId ?? this.outsideUserId,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props =>
      [type, dueDate, status, selectedUserId, insideUserId, outsideUserId, isSubmitting];
}
