import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

/// API client for making HTTP requests using Dio
class ApiClient {
  final Dio dio;
  final String baseUrl;

  ApiClient({
    required this.dio,
    this.baseUrl = 'https://fakestoreapi.com',
  }) {
    // Configure Dio
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Add interceptors for logging (optional)
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
      ),
    );
  }

  /// GET request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }

  /// POST request
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }

  /// PUT request
  Future<dynamic> put(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }

  /// PATCH request
  Future<dynamic> patch(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.patch(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }

  /// DELETE request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }

  /// Process HTTP response
  dynamic _processResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return response.data;
      case 400:
        throw ServerException('Bad request: ${response.data}');
      case 401:
        throw ServerException('Unauthorized: ${response.data}');
      case 403:
        throw ServerException('Forbidden: ${response.data}');
      case 404:
        throw ServerException('Not found: ${response.data}');
      case 500:
      case 502:
      case 503:
        throw ServerException('Server error: ${response.data}');
      default:
        throw ServerException(
          'Error occurred with status code: ${response.statusCode}',
        );
    }
  }

  /// Handle Dio errors
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Connection timeout');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?.toString() ?? 'Unknown error';

        switch (statusCode) {
          case 400:
            return ServerException('Bad request: $message');
          case 401:
            return ServerException('Unauthorized: $message');
          case 403:
            return ServerException('Forbidden: $message');
          case 404:
            return ServerException('Not found: $message');
          case 500:
          case 502:
          case 503:
            return ServerException('Server error: $message');
          default:
            return ServerException('Error $statusCode: $message');
        }

      case DioExceptionType.cancel:
        return const NetworkException('Request cancelled');

      case DioExceptionType.connectionError:
        return const NetworkException(
          'No internet connection. Please check your network.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException('SSL certificate error');

      case DioExceptionType.unknown:
      default:
        return NetworkException('Network error: ${error.message}');
    }
  }
}
