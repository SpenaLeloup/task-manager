import 'package:flutter/foundation.dart';
import '../models/task.dart';

enum TaskFilter { all, active, completed }

enum SortCriteria { createdDate, priority, alphabetical, completionStatus }

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        id: '1',
        title: 'Apprendre Flutter',
        isDone: true,
        priority: Priority.high),
    Task(
        id: '2',
        title: 'Créer ma première app',
        isDone: true,
        priority: Priority.normal),
    Task(id: '3', title: 'Faire les courses', priority: Priority.low),
    Task(id: '4', title: 'Lire 30 minutes', priority: Priority.normal),
    Task(id: '5', title: 'Faire du sport', priority: Priority.high),
  ];

  TaskFilter _currentFilter = TaskFilter.all;
  SortCriteria _sortCriteria = SortCriteria.createdDate;
  bool _sortAscending = true;

  TaskFilter get currentFilter => _currentFilter;
  SortCriteria get sortCriteria => _sortCriteria;
  bool get sortAscending => _sortAscending;

  void setFilter(TaskFilter filter) {
    _currentFilter = filter;
    notifyListeners();
  }

  void setSortCriteria(SortCriteria criteria) {
    if (_sortCriteria == criteria) {
      _sortAscending = !_sortAscending;
    } else {
      _sortCriteria = criteria;
      _sortAscending = true;
    }
    notifyListeners();
  }

  List<Task> get tasks {
    List<Task> filtered;
    switch (_currentFilter) {
      case TaskFilter.all:
        filtered = List.from(_tasks);
        break;
      case TaskFilter.active:
        filtered = _tasks.where((t) => !t.isDone).toList();
        break;
      case TaskFilter.completed:
        filtered = _tasks.where((t) => t.isDone).toList();
        break;
    }
    return _sorted(filtered);
  }

  List<Task> _sorted(List<Task> list) {
    final sorted = [...list];

    sorted.sort((a, b) {
      int cmp;
      switch (_sortCriteria) {
        case SortCriteria.createdDate:
          cmp = a.id.compareTo(b.id);
          break;
        case SortCriteria.priority:
          cmp = b.priority.index.compareTo(a.priority.index);
          break;
        case SortCriteria.alphabetical:
          cmp = a.title.toLowerCase().compareTo(b.title.toLowerCase());
          break;
        case SortCriteria.completionStatus:
          cmp = (a.isDone == b.isDone) ? 0 : (a.isDone ? 1 : -1);
          break;
      }
      return _sortAscending ? cmp : -cmp;
    });

    return List.unmodifiable(sorted);
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
