import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
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

  Color _priorityColor(Priority p) {
    switch (p) {
      case Priority.high:
        return Colors.red;
      case Priority.normal:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }

  String _priorityLabel(Priority p) {
    switch (p) {
      case Priority.high:
        return 'Haute';
      case Priority.normal:
        return 'Normale';
      case Priority.low:
        return 'Basse';
    }
  }

  Widget _priorityChip() {
    Color color = _priorityColor(task.priority);
    String label = _priorityLabel(task.priority);

    return Chip(
      label: Text(label, style: TextStyle(fontSize: 11, color: color)),
      avatar: Icon(Icons.flag, size: 14, color: color),
      backgroundColor: color.withValues(alpha: 0.1),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} à ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _showPriorityMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: Priority.values
            .map((p) => ListTile(
                  leading: Icon(Icons.flag, color: _priorityColor(p)),
                  title: Text(_priorityLabel(p)),
                  onTap: () {
                    final updated = Task(
                      id: task.id,
                      title: task.title,
                      description: task.description,
                      isDone: task.isDone,
                      priority: p,
                      dueDate: task.dueDate,
                    );
                    context.read<TaskProvider>().updateTask(updated);
                    Navigator.pop(context);
                  },
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextDecoration monStyleTexte =
        task.isDone ? TextDecoration.lineThrough : TextDecoration.none;
    Color maCouleurTexte = task.isDone ? Colors.grey : Colors.black;

    final isOverdue = task.dueDate != null &&
        task.dueDate!.isBefore(DateTime.now()) &&
        !task.isDone;

    return GestureDetector(
      onLongPress: () => _showPriorityMenu(context),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (bool? value) => onToggle(),
          ),
          title: Text(
            task.title,
            style: TextStyle(decoration: monStyleTexte, color: maCouleurTexte),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _priorityChip(),
              if (task.dueDate != null) ...[
                const SizedBox(height: 4),
                Text(
                  'Échéance : ${_formatDate(task.dueDate!)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isOverdue ? Colors.red : Colors.grey,
                    fontWeight: isOverdue ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ],
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
                builder: (context) => TaskDetailScreen(task: task),
              ),
            );
          },
        ),
      ),
    );
  }
}
