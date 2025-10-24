import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/network/api_client.dart';
import '../../models/user_model.dart';

/// Remote data source interface for authentication
abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<void> signOut();

  Future<void> resetPassword({required String email});
}

/// Implementation of AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // In a real app, this would call an actual API endpoint
      // For demo purposes, we'll simulate a successful response
      await apiClient.post('/auth/login', {
        'email': email,
        'password': password,
      });

      // Simulated response - in production this would come from the API
      final userData = {
        'id': '1',
        'email': email,
        'name': 'John Doe',
        'avatar': 'https://i.pravatar.cc/150?img=1',
        'createdAt': DateTime.now().toIso8601String(),
      };

      return UserModel.fromJson(userData);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in: $e');
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // In a real app, this would call an actual API endpoint
      await apiClient.post('/auth/register', {
        'email': email,
        'password': password,
        'name': name,
      });

      // Simulated response
      final userData = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'email': email,
        'name': name,
        'avatar': 'https://i.pravatar.cc/150?img=2',
        'createdAt': DateTime.now().toIso8601String(),
      };

      return UserModel.fromJson(userData);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign up: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // In a real app, this would call an actual API endpoint
      await apiClient.post('/auth/logout', {});
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign out: $e');
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      // In a real app, this would call an actual API endpoint
      await apiClient.post('/auth/reset-password', {'email': email});
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to reset password: $e');
    }
  }
}
