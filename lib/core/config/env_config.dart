import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lms/core/config/environment.dart';

class EnvConfig {
  static Future<void> initialize({required Environment environment}) async {
    await dotenv.load(fileName: environment.envFile);
  }
  static String get apiBaseUrl =>
      dotenv.get('API_BASE_URL', fallback: 'https://fakestoreapi.com');
  
  static int get apiTimeout => 
      int.tryParse(dotenv.get('API_TIMEOUT', fallback: '30')) ?? 30;

  static bool get enableLogging =>
      dotenv.get('ENABLE_LOGGING', fallback: 'true').toLowerCase() == 'true';
}
