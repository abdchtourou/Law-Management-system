import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:lms/core/usecases/usecase.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/usecase/get_all_users_use_case.dart';
import '../../domain/usecase/sync_users_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final SyncUsersUseCase syncUsersUseCase;
  StreamSubscription? _userSubscription;

  // Local copy to compare incoming data
  List<User>? _displayedData;

  UserCubit({
    required this.getAllUsersUseCase,
    required this.syncUsersUseCase,
  }) : super(UserInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(UserLoading());

    final result = await getAllUsersUseCase(const NoParams());

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (stream) {
        _userSubscription = stream.listen((incomingData) {
          if (_displayedData == null) {
            // CASE 1: First time loading (App start) or Empty Cache
            _displayedData = incomingData;
            emit(UserSuccess(currentData: incomingData));
          } else {
            // CASE 2: Update received (Background sync finished)
            // Simple check: here we assume if lengths differ or first item differs, it's new

            // Or use better equality check if Equatable is implemented properly on User
            // For now, let's just assume new stream emission implies potential change
            // But to avoid loops, let's trust the stream changes

            if (_displayedData != incomingData) {
              // Works if User lists are equal by value
              emit(UserSuccess(
                  currentData: _displayedData!, pendingData: incomingData));
            }
          }
        });
      },
    );

    // Always sync in background
    syncUsersUseCase(const NoParams());
  }

  void applyUpdate() {
    if (state is UserSuccess) {
      final successState = state as UserSuccess;
      if (successState.pendingData != null) {
        _displayedData = successState.pendingData;
        emit(UserSuccess(currentData: _displayedData!, pendingData: null));
      }
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
