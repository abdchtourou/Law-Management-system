import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

/// Authentication repository interface
/// This defines the contract for authentication operations
/// Implementation will be in the data layer
abstract class AuthRepository {
  /// Signs in a user with email and password
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
    required bool rememberMe,
  });

  /// Signs up a new user
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
  });

  /// Signs out the current user
  Future<Either<Failure, void>> signOut();

  /// Gets the currently authenticated user
  Future<Either<Failure, UserModel?>> getCurrentUser();

  /// Checks if a user is currently signed in
  Future<Either<Failure, bool>> isSignedIn();

  /// Resets password for the given email
  Future<Either<Failure, void>> resetPassword({
    required String email,
  });
}
