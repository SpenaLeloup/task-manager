import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    IconData monIcone;
    Color? maCouleur;
    TextDecoration monStyleTexte;

    if (task.isDone) { 
      monIcone = Icons.check_circle;
      maCouleur = Colors.green;
      monStyleTexte = TextDecoration.lineThrough;
    } else {
      monIcone = Icons.radio_button_unchecked;
      maCouleur = Colors.grey;
      monStyleTexte = TextDecoration.none;
    }

    return ListTile(
      leading: Icon(
        monIcone,
        color: maCouleur,
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: monStyleTexte,
          color: task.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}