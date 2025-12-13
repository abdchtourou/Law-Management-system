import 'core/config/environment.dart';
import 'main.dart';

/// Audit entry point
/// Run with: flutter run --flavor aud -t lib/main_aud.dart
void main() async {
  await mainCommon(environment: Environment.audit);
}
