import 'package:flutter/material.dart';
import '../models/task.dart';

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
          final task = _tasks[index];
          
          return ListTile(
            leading: Icon(
              task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              color: task.isDone ? Colors.green : null,
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
                color: task.isDone ? Colors.grey : Colors.black,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}