import 'dart:convert';

enum Priority { low, normal, high }

enum TaskFilter { all, active, completed }

enum SortCriteria { createdDate, priority, alphabetical, completionStatus }

class Task {
  final String id;
  String title;
  String description;
  bool isDone;
  Priority priority;
  final int createdAt;
  DateTime? dueDate;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
    this.priority = Priority.normal,
    int? createdAt,
    this.dueDate,
  }) : this.createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'priority': priority.index,
      'createdAt': createdAt,
      'due_date': dueDate?.millisecondsSinceEpoch,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      isDone: json['isDone'] as bool,
      priority: Priority.values[json['priority'] as int],
      createdAt: json['createdAt'] as int?,
      dueDate: json['due_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['due_date'] as int)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_done': isDone ? 1 : 0,
      'priority': priority.index,
      'created_at': createdAt,
      'due_date': dueDate?.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      isDone: (map['is_done'] as int) == 1,
      priority: Priority.values[map['priority'] as int],
      createdAt: map['created_at'] as int,
      dueDate: map['due_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['due_date'] as int)
          : null,
    );
  }
}
