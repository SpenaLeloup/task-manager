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

  Color _getPriorityColor() {
    switch (task.priority) {
      case Priority.high:
        return Colors.red;
      case Priority.normal:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextDecoration monStyleTexte =
        task.isDone ? TextDecoration.lineThrough : TextDecoration.none;
    Color maCouleurTexte = task.isDone ? Colors.grey : Colors.black;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(
            width: 6,
            height: 60,
            decoration: BoxDecoration(
              color: _getPriorityColor(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Checkbox(
                value: task.isDone,
                onChanged: (bool? value) => onToggle(),
              ),
              title: Text(
                task.title,
                style:
                    TextStyle(decoration: monStyleTexte, color: maCouleurTexte),
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
                  MaterialPageRoute(
                      builder: (context) => TaskDetailScreen(task: task)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
