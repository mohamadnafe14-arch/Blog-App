import 'dart:io';

import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:blog_app/features/blog/domain/repos/blog_repo.dart';
import 'package:fpdart/fpdart.dart';

class AddBlogUseCaseParams {
  final String title;
  final String posterId;
  final String content;
  final File image;
  final List<String> topics;

  AddBlogUseCaseParams({
    required this.title,
    required this.posterId,
    required this.content,
    required this.image,
    required this.topics,
  });
}

class AddBlogUseCase implements UseCase<Blog, AddBlogUseCaseParams> {
  final BlogRepo blogRepo;
  AddBlogUseCase({required this.blogRepo});
  @override
  Future<Either<Failure, Blog>> call(AddBlogUseCaseParams params) async {
    return await blogRepo.uploadBlog(
      title: params.title,
      posterId: params.posterId,
      content: params.content,
      image: params.image,
      topics: params.topics,
    );
  }
}
