import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';
import '../../data/model/nav_model.dart';

abstract class HomeRepo {
  Stream<HomeModel> getHomeStream();
  Future<Either<Failure, void>> syncHome();
}
