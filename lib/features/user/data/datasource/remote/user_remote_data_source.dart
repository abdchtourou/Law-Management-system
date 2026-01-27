import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lms/core/network/api_client.dart';
import '../../models/user_response_model.dart';
import '../../../../auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getAllUsers();
  Future<void> createUser(Map<String, dynamic> userData);
  Future<void> createClient(Map<String, dynamic> clientData);
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

  @override
  Future<void> createUser(Map<String, dynamic> userData) async {
    try {
      // Create FormData for multipart/form-data upload
      final formData = FormData();

      // Add text fields
      for (var entry in userData.entries) {
        final key = entry.key;
        final value = entry.value;

        // Skip file fields - they'll be added separately
        if (key == 'profile_picture' ||
            key == 'id_picture' ||
            key == 'passport_picture') {
          continue;
        }

        if (value != null && value.toString().isNotEmpty) {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      }

      // Add file fields
      if (userData['profile_picture'] is File) {
        final file = userData['profile_picture'] as File;
        formData.files.add(
          MapEntry(
            'profile_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      if (userData['id_picture'] is File) {
        final file = userData['id_picture'] as File;
        formData.files.add(
          MapEntry(
            'id_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      if (userData['passport_picture'] is File) {
        final file = userData['passport_picture'] as File;
        formData.files.add(
          MapEntry(
            'passport_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      await apiClient.postMultipart(
        '/users/api/users/create/',
        formData,
      );
    } catch (e) {
      print('Error creating user: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<void> createClient(Map<String, dynamic> clientData) async {
    try {
      // Create FormData for multipart/form-data upload
      final formData = FormData();

      // Add text fields
      for (var entry in clientData.entries) {
        final key = entry.key;
        final value = entry.value;

        // Skip file fields - they'll be added separately
        if (key == 'profile_picture' ||
            key == 'id_picture' ||
            key == 'passport_picture') {
          continue;
        }

        if (value != null && value.toString().isNotEmpty) {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      }

      // Add file fields
      if (clientData['profile_picture'] is File) {
        final file = clientData['profile_picture'] as File;
        formData.files.add(
          MapEntry(
            'profile_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      if (clientData['id_picture'] is File) {
        final file = clientData['id_picture'] as File;
        formData.files.add(
          MapEntry(
            'id_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      if (clientData['passport_picture'] is File) {
        final file = clientData['passport_picture'] as File;
        formData.files.add(
          MapEntry(
            'passport_picture',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      await apiClient.postMultipart(
        '/users/api/clients/create/',
        formData,
      );
    } catch (e) {
      print('Error creating client: ${e.toString()}');
      rethrow;
    }
  }
}
