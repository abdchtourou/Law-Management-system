import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';

abstract class UserRepo {
  Stream<List<User>> getUserStream();
  Future<Either<Failure, void>> syncUsers();
  Future<Either<Failure, void>> createUser(Map<String, dynamic> userData);
  Future<Either<Failure, void>> createClient(Map<String, dynamic> clientData);
}
