import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCaseParams {
  final String email;
  final String password;

  const SignInUseCaseParams({required this.email, required this.password});
}

class SignInUseCase implements UseCase<String, SignInUseCaseParams> {
  final AuthRepo authRepo;
  SignInUseCase(this.authRepo);
  @override
  Future<Either<Failure, String>> call(SignInUseCaseParams params) async =>
      await authRepo.signIn(email: params.email, password: params.password);
}
