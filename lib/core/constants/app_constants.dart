import '../config/env_config.dart';

class AppConstants {
  // API Configuration - now loaded from environment
  static String get apiBaseUrl => EnvConfig.apiBaseUrl;
  static Duration get apiTimeout => Duration(seconds: EnvConfig.apiTimeout);

  // Cache Configuration
  static const String cacheKey = 'CACHED_DATA';
  static const Duration cacheValidity = Duration(hours: 1);

  // Error Messages
  static const String serverFailureMessage = 'Server failure occurred';
  static const String cacheFailureMessage = 'Cache failure occurred';
  static const String networkFailureMessage = 'Network connection failed';
  static const String unexpectedFailureMessage = 'Unexpected error occurred';
}
