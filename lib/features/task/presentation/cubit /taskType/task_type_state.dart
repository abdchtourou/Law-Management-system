
import 'package:equatable/equatable.dart';
enum AdminTaskType { legal, administrative }
class TaskTypeState extends Equatable {
  final AdminTaskType? selectedType;

  const TaskTypeState({this.selectedType});

  bool get canContinue => selectedType != null;

  TaskTypeState copyWith({AdminTaskType? selectedType}) {
    return TaskTypeState(selectedType: selectedType);
  }

  @override
  List<Object?> get props => [selectedType];
}