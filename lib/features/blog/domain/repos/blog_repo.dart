import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:fpdart/fpdart.dart';

abstract class BlogRepo {
  Future<Either<Failure, Blog>> uploadBlog({
    required DateTime updatedAt,
    required String title,
    required String posterId,
    required String content,
    required String imageUrl,
    required List<String> topics,
  });
}
