import 'package:dartz/dartz.dart';
import 'package:lms/core/errors/failures.dart';

import '../../data/model/nav_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,HomeModel>> getHome();
}