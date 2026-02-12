import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUserUseCase implements UseCase<User, NoParam> {
  final AuthRepo authRepo;

  GetCurrentUserUseCase(this.authRepo);
  @override
  Future<Either<Failure, User>> call(NoParam params) async {
    return await authRepo.getCurrentUser();
  }
}
