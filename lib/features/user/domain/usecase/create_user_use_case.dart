import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repo/user_repo.dart';

class CreateUserUseCase implements UseCase<void, Map<String, dynamic>> {
  final UserRepo repo;

  CreateUserUseCase(this.repo);

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    return await repo.createUser(params);
  }
}
