part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeSuccess extends HomeState {
  final HomeModel currentData;
  final HomeModel? pendingData; // Holds the new data waiting to be shown

  HomeSuccess({
    required this.currentData,
    this.pendingData,
  });

  // Helper to know if we have updates
  bool get hasUpdate => pendingData != null;

  HomeSuccess copyWith({HomeModel? currentData, HomeModel? pendingData}) {
    return HomeSuccess(
      currentData: currentData ?? this.currentData,
      pendingData: pendingData ?? this.pendingData,
    );
  }
}