import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskTile({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    TextDecoration monStyleTexte;
    Color maCouleurTexte;

    if (task.isDone) {
      monStyleTexte = TextDecoration.lineThrough;
      maCouleurTexte = Colors.grey;
    } else {
      monStyleTexte = TextDecoration.none;
      maCouleurTexte = Colors.black;
    }

    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          onToggle();
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: monStyleTexte,
          color: maCouleurTexte,
        ),
      ),
    );
  }
}
