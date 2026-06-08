import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/database_helper.dart';
import 'task_tile.dart';

class TaskSearchDelegate extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Rechercher une tâche...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults(context);

  Widget _buildSearchResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Center(child: Text('Tapez pour rechercher'));
    }

    return FutureBuilder<List<Task>>(
      future: DatabaseHelper.instance.searchTasks(query.trim()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.hasError) {
          return const Center(child: Text('Erreur lors de la recherche.'));
        }

        final tasks = snapshot.data!;
        if (tasks.isEmpty) {
          return Center(child: Text('Aucun résultat pour "$query"'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskTile(
              task: task,
              onToggle: () {},
              onDelete: () {},
              onEdit: () {},
            );
          },
        );
      },
    );
  }
}
