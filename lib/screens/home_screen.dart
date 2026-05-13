import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Task> _tasks = [
    Task(id: '1', title: 'Apprendre Flutter', isDone: true),
    Task(id: '2', title: 'Créer ma première app', isDone: true),
    Task(id: '3', title: 'Faire les courses'),
    Task(id: '4', title: 'Lire 30 minutes'),
    Task(id: '5', title: 'Faire du sport'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes tâches'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: _tasks[index]);
        },
      ),
    );
  }
}