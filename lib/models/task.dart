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
}
