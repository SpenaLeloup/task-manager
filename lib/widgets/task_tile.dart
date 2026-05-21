import 'package:flutter/material.dart';
import '../models/task.dart';
import '../screens/task_detail_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    TextDecoration monStyleTexte =
        task.isDone ? TextDecoration.lineThrough : TextDecoration.none;
    Color maCouleurTexte = task.isDone ? Colors.grey : Colors.black;

    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) => onToggle(),
      ),
      title: Text(
        task.title,
        style: TextStyle(decoration: monStyleTexte, color: maCouleurTexte),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)),
        );
      },
    );
  }
}
