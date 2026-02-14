import 'dart:io';

import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/blog/data/data_sources/remote_add_blog_data_source.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:blog_app/features/blog/domain/repos/blog_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class BlogRepoImpl implements BlogRepo {
  final RemoteAddBlogDataSource remoteAddBlogDataSource;
  BlogRepoImpl(this.remoteAddBlogDataSource);
  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required String title,
    required String posterId,
    required String content,
    required File image,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        title: title,
        posterId: posterId,
        content: content,
        topics: topics,
        id: Uuid().v1(),
        imageUrl: "",
        updatedAt: DateTime.now(),
      );
      final imageUrl = await remoteAddBlogDataSource.uploadImage(
        blogModel,
        image,
      );
      blogModel = blogModel.copyWith(imageUrl: imageUrl);
      final blog = await remoteAddBlogDataSource.uploadBlog(blogModel);
      return Right(blog);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
