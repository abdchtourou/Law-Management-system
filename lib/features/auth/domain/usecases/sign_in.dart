import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class SignIn implements UseCase<UserModel, SignInParams> {
  final AuthRepository repository;

  SignIn(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(SignInParams params) async {
    return await repository.signIn(
      email: params.email,
      password: params.password,
      rememberMe: params.rememberMe,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;
  final bool rememberMe;

  const SignInParams({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object?> get props => [email, password, rememberMe];
}
