import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCaseParam {
  final String email;
  final String password;
  final String name;

  const SignUpUseCaseParam({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignUpUseCase implements UseCase<User, SignUpUseCaseParam> {
  final AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  @override
  Future<Either<Failure, User>> call(SignUpUseCaseParam params) async =>
      await authRepo.signUp(
        email: params.email,
        password: params.password,
        name: params.name,
      );
}
