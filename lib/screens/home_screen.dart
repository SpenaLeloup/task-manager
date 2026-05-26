import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/empty_state.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [
    Task(id: '1', title: 'Apprendre Flutter', isDone: true),
    Task(id: '2', title: 'Créer ma première app', isDone: true),
    Task(id: '3', title: 'Faire les courses'),
    Task(id: '4', title: 'Lire 30 minutes'),
    Task(id: '5', title: 'Faire du sport'),
  ];

  Future<void> _navigateToAddTask() async {
    final newTask = await Navigator.pushNamed(context, '/add') as Task?;

    if (newTask != null) {
      setState(() {
        _tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Mes tâches (${_tasks.where((t) => !t.isDone).length} restantes)'),
      ),
      body: _tasks.isEmpty
          ? const EmptyState()
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];

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
                    setState(() {
                      _tasks.removeAt(index);
                    });
                  },
                  child: TaskTile(
                    task: task,
                    onToggle: () {
                      setState(() {
                        _tasks[index].isDone = !_tasks[index].isDone;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        _tasks.removeAt(index);
                      });
                    },
                    onEdit: () async {
                      final updatedTask = await Navigator.push<Task>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(taskToEdit: task),
                        ),
                      );

                      if (updatedTask != null) {
                        setState(() {
                          _tasks[index] = updatedTask;
                        });
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
