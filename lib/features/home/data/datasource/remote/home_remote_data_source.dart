import 'package:lms/core/network/api_client.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../model/nav_model.dart';

abstract class HomeRemoteDataSource{
  Future<HomeModel> getHome();
}
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<HomeModel> getHome() async {
    try{

      final  response= await apiClient.get('/api/mobile/home/',);

      return HomeModel.fromJson(response);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in: $e');
    }

  }

}