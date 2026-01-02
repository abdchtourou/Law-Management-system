import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';

abstract class UserRepo {
  Stream<List<User>> getUserStream();
  Future<Either<Failure, void>> syncUsers();
}
