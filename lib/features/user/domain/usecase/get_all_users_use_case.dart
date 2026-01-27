import 'package:dartz/dartz.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../repo/user_repo.dart';

class GetAllUsersUseCase extends UseCase<Stream<List<User>>, NoParams> {
  final UserRepo userRepo;

  GetAllUsersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, Stream<List<User>>>> call(NoParams params) async {
    print('jdshalkfhjs');
    return Right(userRepo.getUserStream());
  }
}
