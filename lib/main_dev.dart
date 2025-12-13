import 'core/config/environment.dart';
import 'main.dart';

/// Development entry point
/// Run with: flutter run --flavor dev -t lib/main_dev.dart
void main() async {
  await mainCommon(environment: Environment.development);
}
