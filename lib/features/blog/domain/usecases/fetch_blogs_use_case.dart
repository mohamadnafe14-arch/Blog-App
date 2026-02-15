import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:blog_app/features/blog/domain/repos/blog_repo.dart';
import 'package:fpdart/fpdart.dart';

class FetchBlogsUseCase implements UseCase<List<Blog>, NoParam> {
  final BlogRepo blogRepo;

  FetchBlogsUseCase({required this.blogRepo});

  @override
  Future<Either<Failure, List<Blog>>> call(NoParam noParam) async =>
      await blogRepo.getBlogs();
}
