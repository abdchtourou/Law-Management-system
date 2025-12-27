import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../repo/home_repo.dart';

class SyncHomeUseCase extends UseCase<void, NoParams> {
  final HomeRepo homeRepo;

  SyncHomeUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await homeRepo.syncHome();
  }
}
