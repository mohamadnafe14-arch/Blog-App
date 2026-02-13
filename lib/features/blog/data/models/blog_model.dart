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
  Map<String, dynamic> toMap() => {
    'id': id,
    'updatedAt': updatedAt,
    'title': title,
    'posterId': posterId,
    'content': content,
    'imageUrl': imageUrl,
    'topics': topics,
  };

  factory BlogModel.fromMap(Map<String, dynamic> map) => BlogModel(
    id: map['id'] as String,
    updatedAt: map['updatedAt'] as DateTime,
    title: map['title'] as String,
    posterId: map['posterId'] as String,
    content: map['content'] as String,
    imageUrl: map['imageUrl'] as String,
    topics: List<String>.from(map['topics'] as List<String> 
    ),
  );
}
