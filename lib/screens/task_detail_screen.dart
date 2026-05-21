import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Statut :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(task.isDone ? "Terminée" : "En cours"),
            if (task.description.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Description :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(task.description),
            ],
          ],
        ),
      ),
    );
  }
}
