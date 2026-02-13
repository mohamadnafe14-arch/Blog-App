class Blog {
  final String id;
  final DateTime updatedAt;
  final String title;
  final String posterId;
  final String content;
  final String? imageUrl;
  final List<String>? topics;

  Blog({
    required this.id,
    required this.updatedAt,
    required this.title,
    required this.posterId,
    required this.content,
    this.imageUrl,
    this.topics,
  });

  Blog copyWith({
    String? id,
    DateTime? updatedAt,
    String? title,
    String? posterId,
    String? content,
    String? imageUrl,
    List<String>? topics,
  }) {
    return Blog(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      posterId: posterId ?? this.posterId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      topics: topics ?? this.topics,
    );
  }
}
