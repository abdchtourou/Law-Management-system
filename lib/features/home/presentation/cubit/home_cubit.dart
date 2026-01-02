import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../data/model/nav_model.dart';
import '../../domain/usecase/get_home_stream_use_case.dart';
import '../../domain/usecase/sync_home_use_case.dart';

import 'package:flutter/foundation.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../user/domain/usecase/get_all_users_use_case.dart';
import '../../../user/domain/usecase/sync_users_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeStreamUseCase getHomeStreamUseCase;
  final SyncHomeUseCase syncHomeUseCase;
  final GetAllUsersUseCase getAllUsersUseCase;
  final SyncUsersUseCase syncUsersUseCase;

  StreamSubscription? _homeSubscription;
  StreamSubscription? _usersSubscription;

  // We keep local copies to compare incoming data
  HomeModel? _displayedData;
  List<User>? _displayedUsers;

  HomeCubit({
    required this.getHomeStreamUseCase,
    required this.syncHomeUseCase,
    required this.getAllUsersUseCase,
    required this.syncUsersUseCase,
  }) : super(HomeInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(HomeLoading());

    // 1. Start both UseCases in parallel
    final homeFuture = getHomeStreamUseCase(const NoParams());
    final usersFuture = getAllUsersUseCase(const NoParams());

    // 2. Await results
    final homeResult = await homeFuture;
    final usersResult = await usersFuture;

    // Handle Home Stream
    homeResult.fold(
      (failure) => emit(HomeError(failure.message)),
      (stream) {
        _homeSubscription = stream.listen((incomingData) {
          if (_displayedData == null) {
            // Initial load
            _displayedData = incomingData;
            _emitSuccess();
          } else if (incomingData != _displayedData) {
            // Home Update
            emit((state as HomeSuccess).copyWith(pendingData: incomingData));
          }
        });
      },
    );

    // Handle User Stream
    usersResult.fold(
      (failure) => emit(HomeError(failure.message)), // Or handle silently
      (stream) {
        _usersSubscription = stream.listen((incomingUsers) {
          if (_displayedUsers == null) {
            _displayedUsers = incomingUsers;
            _emitSuccess();
          } else {
            // Use listEquals from foundation. key fields check via Equatable.
            if (!listEquals(_displayedUsers, incomingUsers)) {
              emit(
                  (state as HomeSuccess).copyWith(pendingUsers: incomingUsers));
            }
          }
        });
      },
    );

    // Initial Syncs
    syncHomeUseCase(const NoParams());
    syncUsersUseCase(const NoParams());
  }

  void _emitSuccess() {
    // Only emit if we have at least home data (users optional?)
    // Or wait for both? Let's show whatever we have.
    if (_displayedData != null) {
      // If we are already in success state, preserve other data
      if (state is HomeSuccess) {
        emit((state as HomeSuccess).copyWith(
          currentData: _displayedData,
          currentUsers: _displayedUsers ?? [],
        ));
      } else {
        emit(HomeSuccess(
          currentData: _displayedData!,
          currentUsers: _displayedUsers ?? [],
        ));
      }
    }
  }

  // CALL THIS when user clicks the "Show New Data" button
  void applyUpdate() {
    if (state is HomeSuccess) {
      final successState = state as HomeSuccess;

      // Update Home Data
      if (successState.pendingData != null) {
        _displayedData = successState.pendingData;
      }

      // Update User Data
      if (successState.pendingUsers != null) {
        _displayedUsers = successState.pendingUsers;
      }

      emit(HomeSuccess(
          currentData: _displayedData!,
          currentUsers: _displayedUsers ?? [],
          pendingData: null,
          pendingUsers: null));
    }
  }

  @override
  Future<void> close() {
    _homeSubscription?.cancel();
    _usersSubscription?.cancel();
    return super.close();
  }
}
