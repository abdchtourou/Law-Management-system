import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';
import 'package:lms/features/home/data/model/nav_model.dart';
import 'package:lms/features/home/data/model/isar/home_isar_model.dart';
import '../../domain/repo/home_repo.dart';
import '../datasource/local/home_local_data_source.dart';
import '../datasource/remote/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override

  @override
  Stream<HomeModel> getHomeStream() {
    return localDataSource.getHomeStream().map((list) {
      if (list.isEmpty) {
        // Return an empty model or handle empty state.
        // Returning a default model for now.
        return HomeModel();
      }
      return list.first.toEntity();
    });
  }

  @override
  Future<Either<Failure, void>> syncHome() async {
    try {

      final remoteHome = await remoteDataSource.getHome();
      await localDataSource.cacheHome(HomeIsarModel.fromEntity(remoteHome));
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
