import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';

/// Base class for authentication states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {}

/// Loading state (during authentication operations)
class AuthLoading extends AuthState {}

/// Authenticated state (user is signed in)
class AuthAuthenticated extends AuthState {
  final UserModel user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

/// Unauthenticated state (user is not signed in)
class AuthUnauthenticated extends AuthState {}

/// Error state (authentication failed)
class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
