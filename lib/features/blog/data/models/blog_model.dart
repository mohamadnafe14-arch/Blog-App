import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:hive/hive.dart';

part 'blog_model.g.dart'; // 👈 أضف دي

@HiveType(typeId: 0) // 👈 أضف دي
class BlogModel extends Blog {
  @HiveField(0) // 👈 أضف دول
  @override
  // ignore: overridden_fields
  final String id;

  @HiveField(1)
  @override
  // ignore: overridden_fields
  final DateTime updatedAt;

  @HiveField(2)
  @override
  // ignore: overridden_fields
  final String title;

  @HiveField(3)
  @override
  // ignore: overridden_fields
  final String posterId;

  @HiveField(4)
  @override
  // ignore: overridden_fields
  final String content;

  @HiveField(5)
  @override
  // ignore: overridden_fields
  final String imageUrl;

  @HiveField(6)
  @override
  // ignore: overridden_fields
  final List<String> topics;

  @HiveField(7)
  @override
  // ignore: overridden_fields
  final String? name;

  BlogModel({
    required this.id,
    required this.updatedAt,
    required this.title,
    required this.posterId,
    required this.content,
    required this.imageUrl,
    required this.topics,
    this.name,
  }) : super(
         id: id,
         updatedAt: updatedAt,
         title: title,
         posterId: posterId,
         content: content,
         imageUrl: imageUrl,
         topics: topics,
         name: name,
       );

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
    updatedAt: DateTime.parse(map['updated_at'] as String),
    title: map['title'] as String,
    posterId: map['poster_id'] as String,
    content: map['content'] as String,
    imageUrl: map['image_url'] as String,
    topics: List<String>.from(map['topics'] ?? []),
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
