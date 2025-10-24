/// Base class for all exceptions in the application
/// Exceptions are thrown at the data layer
class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

/// Exception when server communication fails
class ServerException extends AppException {
  const ServerException(super.message);
}

/// Exception when there's no internet connection
class NetworkException extends AppException {
  const NetworkException(super.message);
}

/// Exception when cache operations fail
class CacheException extends AppException {
  const CacheException(super.message);
}

/// Exception for validation errors
class ValidationException extends AppException {
  const ValidationException(super.message);
}
