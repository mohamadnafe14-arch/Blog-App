part of 'blog_cubit.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogUploadSuccess extends BlogState {}

final class FetchBlogsSuccess extends BlogState {
  final List<Blog> blogs;
  FetchBlogsSuccess(this.blogs);
}

final class BlogFailure extends BlogState {
  final String message;
  BlogFailure(this.message);
}
