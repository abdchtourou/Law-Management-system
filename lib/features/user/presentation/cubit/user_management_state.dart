part of 'user_management_cubit.dart';

@immutable
abstract class UserManagementState {}

class UserManagementInitial extends UserManagementState {}

class UserManagementLoading extends UserManagementState {}

class UserManagementLoaded extends UserManagementState {
  final List<User> users;
  final bool isRefreshing;

  UserManagementLoaded(this.users, {this.isRefreshing = false});
}

class UserManagementError extends UserManagementState {
  final String message;
  UserManagementError(this.message);
}
