import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class StorageService {
  static const _tasksKey = 'tasks';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_tasksKey);

    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((json) => Task.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(tasks.map((t) => t.toJson()).toList());
    await prefs.setString(_tasksKey, jsonString);
  }
}
