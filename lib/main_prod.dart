import 'core/config/environment.dart';
import 'main.dart';

/// Production entry point
/// Run with: flutter run --flavor prod -t lib/main_prod.dart
void main() async {
  await mainCommon(environment: Environment.production);
}
