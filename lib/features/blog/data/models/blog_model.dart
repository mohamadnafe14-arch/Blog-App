import 'package:blog_app/features/blog/domain/enities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.updatedAt,
    required super.title,
    required super.posterId,
    required super.content,
    required super.imageUrl,
    required super.topics,
  });
}
