/// Application-wide constants
class AppConstants {
  // API
  static const String apiBaseUrl = 'https://fakestoreapi.com';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Cache
  static const String cacheKey = 'CACHED_DATA';
  static const Duration cacheValidity = Duration(hours: 1);

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;

  // Error Messages
  static const String serverFailureMessage = 'Server failure occurred';
  static const String cacheFailureMessage = 'Cache failure occurred';
  static const String networkFailureMessage = 'Network connection failed';
  static const String unexpectedFailureMessage = 'Unexpected error occurred';
}
