import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';
import 'package:lms/core/usecases/usecase.dart';
import 'package:lms/features/home/data/model/nav_model.dart';
import 'package:lms/features/home/domain/repo/home_repo.dart';

class GetHomeUseCase extends UseCase<HomeModel,NoParams>{
  final HomeRepo homeRepo;

  GetHomeUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, HomeModel>> call(NoParams params)async {
  return await homeRepo.getHome();
  }

}