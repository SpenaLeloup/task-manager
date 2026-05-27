import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/empty_state.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final tasks = taskProvider.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes tâches (${taskProvider.pendingCount} restantes)'),
      ),
      body: tasks.isEmpty
          ? const EmptyState()
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Dismissible(
                  key: Key(task.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    context.read<TaskProvider>().deleteTask(task.id);
                  },
                  child: TaskTile(
                    task: task,
                    onToggle: () {
                      context.read<TaskProvider>().toggleTask(task.id);
                    },
                    onDelete: () {
                      context.read<TaskProvider>().deleteTask(task.id);
                    },
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(taskToEdit: task),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
