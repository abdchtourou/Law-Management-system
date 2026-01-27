import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repo/user_repo.dart';

class UpdateUserUseCase implements UseCase<void, UpdateUserParams> {
  final UserRepo repo;

  UpdateUserUseCase(this.repo);

  @override
  Future<Either<Failure, void>> call(UpdateUserParams params) async {
    return await repo.updateUser(params.id, params.userData);
  }
}

class UpdateUserParams extends Equatable {
  final int id;
  final Map<String, dynamic> userData;

  const UpdateUserParams({required this.id, required this.userData});

  @override
  List<Object> get props => [id, userData];
}
