import 'package:dio/dio.dart';
import '../../features/auth/data/datasources/local/auth_local_data_source.dart';

class TokenInterceptor extends Interceptor {
  final AuthLocalDataSource authLocalDataSource;

  TokenInterceptor({required this.authLocalDataSource});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final user = await authLocalDataSource.getCachedUser();
    if (user != null && user.tokens?.access != null) {
      options.headers['Authorization'] = 'Bearer ${user.tokens!.access}';
    }
    super.onRequest(options, handler);
  }
}
