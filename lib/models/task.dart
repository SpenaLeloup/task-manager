import 'dart:convert';

enum Priority { low, normal, high }

class Task {
  final String id;
  String title;
  String description;
  bool isDone;
  Priority priority;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
    this.priority = Priority.normal,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'priority': priority.index,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      isDone: json['isDone'] as bool,
      priority: Priority.values[json['priority'] as int],
    );
  }
}
