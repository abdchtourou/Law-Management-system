part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> currentData;
  final List<User>? pendingData;

  UserSuccess({required this.currentData, this.pendingData});

  bool get hasUpdate => pendingData != null;
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
