class NoteModel {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'] is int
        ? json['id'] as int
        : int.parse(json['id'].toString()),
    title: json['title'] ?? '',
    content: json['content'] ?? '',
    createdAt: DateTime.parse(
      json['createdAt'] ?? DateTime.now().toIso8601String(),
    ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'createdAt': createdAt.toIso8601String(),
  };
}
