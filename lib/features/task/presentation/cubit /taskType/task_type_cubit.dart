import 'package:bloc/bloc.dart';
import 'package:lms/features/task/presentation/cubit%20/taskType/task_type_state.dart';

class TaskTypeCubit extends Cubit<TaskTypeState> {
  TaskTypeCubit() : super(const TaskTypeState());

  void select(AdminTaskType type) {
    emit(state.copyWith(selectedType: type));
  }

  void clear() {
    emit(const TaskTypeState());
  }
}