import 'package:lms/core/network/api_client.dart';
import '../../models/user_response_model.dart';
import '../../../../auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getAllUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<User>> getAllUsers() async {
    try {
      final response = await apiClient.get(
        '/users/api/users/', // Based on typical REST patterns or previous code contexts
      );

      final userResponse = UserResponse.fromJson(response);
      return userResponse.users ?? [];
    } catch (e) {
      print('aslkjhdfkjh ${e.toString()}');
      rethrow;
    }
  }
}
