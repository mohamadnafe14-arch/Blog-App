import 'package:blog_app/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String name,
  });
}
