import 'dart:io';

import 'package:blog_app/core/utils/use_case.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:blog_app/features/blog/domain/usecases/add_blog_use_case.dart';
import 'package:blog_app/features/blog/domain/usecases/fetch_blogs_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  final AddBlogUseCase addBlogUseCase;
  final FetchBlogsUseCase fetchBlogsUseCase;
  List<String> topics = [];
  File? image;
  BlogCubit({required this.addBlogUseCase, required this.fetchBlogsUseCase})
    : super(BlogInitial());
  Future<void> addBlog({
    required String title,
    required String posterId,
    required String content,
    required File image,
    required List<String> topics,
  }) async {
    emit(BlogLoading());
    final result = await addBlogUseCase.call(
      AddBlogUseCaseParams(
        title: title,
        posterId: posterId,
        content: content,
        image: image,
        topics: topics,
      ),
    );
    result.fold(
      (l) => emit(BlogFailure(l.errMessage)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  Future<void> fetchBlogs() async {
    emit(BlogLoading());
    final result = await fetchBlogsUseCase.call(NoParam());
    result.fold(
      (l) => emit(BlogFailure(l.errMessage)),
      (r) => emit(FetchBlogsSuccess(r)),
    );
  }

  void considerTopics(String topic) {
    if (topics.contains(topic)) {
      topics.remove(topic);
    } else {
      topics.add(topic);
    }
  }

  void clearTopics() {
    topics.clear();
  }

  void clearImage() {
    image = null;
  }

  void setImage(File image) {
    this.image = image;
  }
}
