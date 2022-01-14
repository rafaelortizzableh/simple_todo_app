import 'dart:convert';

class Todo {
  final String title;
  final String description;
  final bool done;

  Todo({
    required this.title,
    required this.description,
    required this.done,
  });

  Todo copyWith({
    String? title,
    String? description,
    bool? done,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'done': done,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      done: map['done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() =>
      'Todo(title: $title, description: $description, done: $done)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.title == title &&
        other.description == description &&
        other.done == done;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ done.hashCode;
}
