import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repos/auth_repo.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final RemoteAuthDataSource remoteAuthDataSource;

  AuthRepoImpl(this.remoteAuthDataSource);
  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await remoteAuthDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final res = await remoteAuthDataSource.signUp(
        email: email,
        password: password,
        name: name,
      );
      return Right(res);
    }  on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
