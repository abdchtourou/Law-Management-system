import 'package:dartz/dartz.dart';

import 'package:lms/core/errors/failures.dart';

import 'package:lms/features/home/data/model/nav_model.dart';

import '../../../domain/repo/home_repo.dart';
import '../remote/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, HomeModel>> getHome() async {
    try {
      final home = await remoteDataSource.getHome();
      return Right(home);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
