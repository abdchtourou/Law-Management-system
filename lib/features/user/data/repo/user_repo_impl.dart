import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';
import 'package:lms/features/auth/data/models/user_model.dart';
import '../../domain/repo/user_repo.dart';
import '../../data/datasource/local/user_local_data_source.dart';
import '../../data/datasource/remote/user_remote_data_source.dart';
import '../../data/models/isar/user_isar_model.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Stream<List<User>> getUserStream() async* {
    bool hasCheckedEmpty = false;

    await for (final list in localDataSource.getUserStream()) {
      if (list.isEmpty && !hasCheckedEmpty) {
        hasCheckedEmpty = true;
        continue;
      }

      if (list.isNotEmpty) {
        yield list.map((e) => e.toEntity()).toList();
      }
    }
  }

  @override
  Future<Either<Failure, void>> syncUsers() async {
    try {
      final remoteUsers = await remoteDataSource.getAllUsers();
      final isarUsers =
          remoteUsers.map((e) => UserIsarModel.fromEntity(e)).toList();
      await localDataSource.cacheUsers(isarUsers);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createUser(
      Map<String, dynamic> userData) async {
    try {
      await remoteDataSource.createUser(userData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createClient(
      Map<String, dynamic> clientData) async {
    try {
      await remoteDataSource.createClient(clientData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(
      int id, Map<String, dynamic> userData) async {
    try {
      await remoteDataSource.updateUser(id, userData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
