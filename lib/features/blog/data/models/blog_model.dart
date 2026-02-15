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
    super.name,
  });
  Map<String, dynamic> toMap() => {
    'id': id,
    'updated_at': updatedAt.toIso8601String(),
    'title': title,
    'poster_id': posterId,
    'content': content,
    'image_url': imageUrl,
    'topics': topics,
  };

  factory BlogModel.fromMap(Map<String, dynamic> map) => BlogModel(
    id: map['id'] as String,
    updatedAt: map['updatedAt'] as DateTime,
    title: map['title'] as String,
    posterId: map['poster_id'] as String,
    content: map['content'] as String,
    imageUrl: map['imageUrl'] as String,
    topics: List<String>.from(map['topics'] as List<String>),
  );
  @override
  BlogModel copyWith({
    String? id,
    DateTime? updatedAt,
    String? title,
    String? posterId,
    String? content,
    String? imageUrl,
    List<String>? topics,
    String? name,
  }) {
    return BlogModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      posterId: posterId ?? this.posterId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      topics: topics ?? this.topics,
      name: name ?? this.name,
    );
  }
}
