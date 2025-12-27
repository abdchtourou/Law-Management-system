import 'package:dartz/dartz.dart';
import 'package:lms/core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../data/model/nav_model.dart';
import '../repo/home_repo.dart';

class GetHomeStreamUseCase extends UseCase<Stream<HomeModel>, NoParams> {
  final HomeRepo homeRepo;

  GetHomeStreamUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, Stream<HomeModel>>> call(NoParams params) async {
    return Right(homeRepo.getHomeStream());
  }
}
