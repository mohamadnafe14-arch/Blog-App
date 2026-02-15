import 'dart:io';

import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract class BlogRepo {
  Future<Either<Failure, Blog>> uploadBlog({
    required String title,
    required String posterId,
    required String content,
    required File image,
    required List<String> topics,
  });

  Future<Either<Failure, List<Blog>>> getBlogs();
}
