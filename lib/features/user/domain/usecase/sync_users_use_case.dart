import 'package:dartz/dartz.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../repo/user_repo.dart';

class SyncUsersUseCase extends UseCase<void, NoParams> {
  final UserRepo userRepo;

  SyncUsersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await userRepo.syncUsers();
  }
}
