import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../data/model/nav_model.dart';
import '../../domain/usecase/get_home_stream_use_case.dart';
import '../../domain/usecase/sync_home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeStreamUseCase getHomeStreamUseCase;
  final SyncHomeUseCase syncHomeUseCase;
  StreamSubscription? _homeSubscription;

  // We keep a local copy to compare incoming data
  HomeModel? _displayedData;

  HomeCubit({
    required this.getHomeStreamUseCase,
    required this.syncHomeUseCase,
  }) : super(HomeInitial()) {
    _init();
  }

  Future<void> _init() async {
    emit(HomeLoading());

    final result = await getHomeStreamUseCase(const NoParams());

    result.fold(
          (failure) => emit(HomeError(failure.message)),
          (stream) {
        _homeSubscription = stream.listen((incomingData) {
          if (_displayedData == null) {
            // CASE 1: First time loading (App start)
            // Show data immediately
            _displayedData = incomingData;
            emit(HomeSuccess(currentData: incomingData));
          } else {
            // CASE 2: Update received (Background sync finished)
            // Check if data is actually different to avoid useless buttons
            if (incomingData != _displayedData) {
              // Don't replace currentData yet! Store in pendingData.
              emit(HomeSuccess(
                  currentData: _displayedData!,
                  pendingData: incomingData
              ));
            }
          }
        });
      },
    );

    // Start background sync
    syncHomeUseCase(const NoParams());
  }

  // CALL THIS when user clicks the "Show New Data" button
  void applyUpdate() {
    if (state is HomeSuccess) {
      final successState = state as HomeSuccess;
      if (successState.pendingData != null) {
        // Swap pending to current
        _displayedData = successState.pendingData;

        emit(HomeSuccess(
            currentData: _displayedData!,
            pendingData: null // Clear pending
        ));
      }
    }
  }

  @override
  Future<void> close() {
    _homeSubscription?.cancel();
    return super.close();
  }
}