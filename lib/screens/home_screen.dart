import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

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

  void _showAddTaskDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nouvelle tâche'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Titre de la tâche'),
        ),
        actions: [
          TextButton(
            // [cite: 109]
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  _tasks.add(Task(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: controller.text.trim(),
                  ));
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Mes tâches (${_tasks.where((t) => !t.isDone).length} restantes)'),
      ),
      body: ListView.builder(
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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
