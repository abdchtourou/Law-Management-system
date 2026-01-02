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
  final List<User> currentUsers;
  final List<User>? pendingUsers;

  HomeSuccess({
    required this.currentData,
    this.pendingData,
    this.currentUsers = const [],
    this.pendingUsers,
  });

  // Helper to know if we have updates
  bool get hasUpdate => pendingData != null || pendingUsers != null;

  HomeSuccess copyWith({
    HomeModel? currentData,
    HomeModel? pendingData,
    List<User>? currentUsers,
    List<User>? pendingUsers,
  }) {
    return HomeSuccess(
      currentData: currentData ?? this.currentData,
      pendingData: pendingData ?? this.pendingData,
      currentUsers: currentUsers ?? this.currentUsers,
      pendingUsers: pendingUsers ?? this.pendingUsers,
    );
  }
}
