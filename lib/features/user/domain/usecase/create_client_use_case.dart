import 'package:dartz/dartz.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../repo/user_repo.dart';

class CreateClientUseCase extends UseCase<void, Map<String, dynamic>> {
  final UserRepo userRepo;

  CreateClientUseCase({required this.userRepo});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    return await userRepo.createClient(params);
  }
}
