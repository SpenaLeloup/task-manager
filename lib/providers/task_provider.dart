import 'package:flutter/foundation.dart';
import '../models/task.dart';

enum TaskFilter { all, active, completed }

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(id: '1', title: 'Apprendre Flutter', isDone: true),
    Task(id: '2', title: 'Créer ma première app', isDone: true),
    Task(id: '3', title: 'Faire les courses'),
    Task(id: '4', title: 'Lire 30 minutes'),
    Task(id: '5', title: 'Faire du sport'),
  ];

  TaskFilter _currentFilter = TaskFilter.all;

  TaskFilter get currentFilter => _currentFilter;

  void setFilter(TaskFilter filter) {
    _currentFilter = filter;
    notifyListeners();
  }

  List<Task> get tasks {
    switch (_currentFilter) {
      case TaskFilter.all:
        return List.unmodifiable(_tasks);
      case TaskFilter.active:
        return List.unmodifiable(_tasks.where((t) => !t.isDone));
      case TaskFilter.completed:
        return List.unmodifiable(_tasks.where((t) => t.isDone));
    }
  }

  int get totalCount => _tasks.length;

  int get pendingCount => _tasks.where((t) => !t.isDone).length;

  int get completedCount => _tasks.where((t) => t.isDone).length;

  double get completionRate {
    if (_tasks.isEmpty) return 0.0;
    return completedCount / _tasks.length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }
}
