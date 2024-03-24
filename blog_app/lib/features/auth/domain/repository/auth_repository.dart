import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signin({
    required String email,
    required String password,
  });
}
