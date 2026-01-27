import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/data/models/user_model.dart';
import 'dart:async';
import '../../domain/usecase/sync_users_use_case.dart';
import '../../domain/usecase/get_all_users_use_case.dart';

part 'user_management_state.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final SyncUsersUseCase syncUsersUseCase;
  StreamSubscription? _usersSubscription;

  List<User>? _currentUsers;

  UserManagementCubit({
    required this.getAllUsersUseCase,
    required this.syncUsersUseCase,
  }) : super(UserManagementInitial());

  Future<void> getAllUsers() async {
    print('🔵 getAllUsers called');
    emit(UserManagementLoading());

    final result = await getAllUsersUseCase(NoParams());
    result.fold(
      (failure) => emit(UserManagementError(failure.message)),
      (stream) {
        _usersSubscription = stream.listen((incomingUsers) {
          print('🟢 Stream emitted ${incomingUsers.length} users');
          _currentUsers = incomingUsers;
          final isCurrentlyRefreshing = state is UserManagementLoaded
              ? (state as UserManagementLoaded).isRefreshing
              : false;
          emit(UserManagementLoaded(_currentUsers!,
              isRefreshing: isCurrentlyRefreshing));
          print(
              '🟢 Emitted UserManagementLoaded with ${_currentUsers!.length} users');
        }, onError: (error) {
          emit(UserManagementError(error.toString()));
        });
      },
    );

    // Trigger API Sync and update refresh status
    // Set refreshing to true before starting sync
    if (_currentUsers != null) {
      emit(UserManagementLoaded(_currentUsers!, isRefreshing: true));
    }

    print('🟡 Starting API sync...');
    final syncResult = await syncUsersUseCase(NoParams());

    syncResult.fold(
      (failure) {
        // Keep showing cached data without error
        print('🔴 Sync failed: ${failure.message}');
        if (_currentUsers != null) {
          emit(UserManagementLoaded(_currentUsers!, isRefreshing: false));
        } else {
          // No cache available and API failed
          emit(UserManagementError(failure.message));
        }
      },
      (_) {
        print('✅ Sync succeeded');
        // Sync succeeded
        // If still in loading state, data will come from stream listener
        // Otherwise, remove the refreshing indicator
        if (_currentUsers != null && state is! UserManagementLoading) {
          emit(UserManagementLoaded(_currentUsers!, isRefreshing: false));
        }
        // If state is still UserManagementLoading, the stream will emit soon
      },
    );
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }
}
