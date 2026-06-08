import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/database_helper.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  bool _isLoading = true;

  TaskProvider() {
    _loadFromDatabase();
  }

  bool get isLoading => _isLoading;
  TaskFilter _currentFilter = TaskFilter.all;
  SortCriteria _sortCriteria = SortCriteria.createdDate;
  bool _sortAscending = true;

  TaskFilter get currentFilter => _currentFilter;
  SortCriteria get sortCriteria => _sortCriteria;
  bool get sortAscending => _sortAscending;

  Future<void> _loadFromDatabase() async {
    final saved = await DatabaseHelper.instance.getAllTasks();
    _tasks.addAll(saved);
    _isLoading = false;
    notifyListeners();
  }

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

  Future<void> addTask(Task task) async {
    await DatabaseHelper.instance.insertTask(task);
    _tasks.add(task);
    notifyListeners();
  }

  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index].isDone = !_tasks[index].isDone;
      await DatabaseHelper.instance.updateTask(_tasks[index]);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      _tasks[index].title = updatedTask.title;
      _tasks[index].description = updatedTask.description;
      _tasks[index].priority = updatedTask.priority;
      _tasks[index].isDone = updatedTask.isDone;

      await DatabaseHelper.instance.updateTask(_tasks[index]);
      notifyListeners();
    }
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
}
