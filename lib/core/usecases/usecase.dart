import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base class for all use cases
/// Type [Type] represents the return type
/// Type [Params] represents the parameters required by the use case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when a use case doesn't require any parameters
class NoParams {
  const NoParams();
}
