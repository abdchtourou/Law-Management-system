import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
/// Failures represent errors in the domain layer
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Failure when server communication fails
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure when there's no internet connection
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Failure when cache operations fail
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
