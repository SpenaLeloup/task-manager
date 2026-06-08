import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/empty_state.dart';
import '../widgets/task_search_delegate.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _filters = [
    TaskFilter.all,
    TaskFilter.active,
    TaskFilter.completed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<TaskProvider>().setFilter(_filters[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _sortLabel(SortCriteria criteria) {
    switch (criteria) {
      case SortCriteria.createdDate:
        return 'Date de création';
      case SortCriteria.priority:
        return 'Priorité';
      case SortCriteria.alphabetical:
        return 'Ordre alphabétique';
      case SortCriteria.completionStatus:
        return 'Statut';
    }
  }

  PopupMenuItem<SortCriteria> _sortItem(
      SortCriteria criteria, String label, IconData icon) {
    return PopupMenuItem(
      value: criteria,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes tâches (${provider.pendingCount} restantes)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher',
            onPressed: () => showSearch(
              context: context,
              delegate: TaskSearchDelegate(),
            ),
          ),
          PopupMenuButton<SortCriteria>(
            icon: const Icon(Icons.sort),
            tooltip: 'Trier par',
            onSelected: (criteria) {
              context.read<TaskProvider>().setSortCriteria(criteria);
            },
            itemBuilder: (context) => [
              _sortItem(SortCriteria.createdDate, 'Date de création',
                  Icons.access_time),
              _sortItem(SortCriteria.priority, 'Priorité', Icons.flag),
              _sortItem(SortCriteria.alphabetical, 'Ordre alphabétique',
                  Icons.sort_by_alpha),
              _sortItem(SortCriteria.completionStatus, 'Statut',
                  Icons.check_circle_outline),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Toutes'),
                  const SizedBox(width: 6),
                  Badge(
                      label: Text('${provider.totalCount}'),
                      backgroundColor: Colors.indigo.shade300),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('En cours'),
                  const SizedBox(width: 6),
                  Badge(
                      label: Text('${provider.pendingCount}'),
                      backgroundColor: Colors.orange),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Terminées'),
                  const SizedBox(width: 6),
                  Badge(
                      label: Text('${provider.completedCount}'),
                      backgroundColor: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: provider.completionRate,
            backgroundColor: Colors.grey[200],
            minHeight: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                const Text('Tri : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                Chip(
                  label: Text(_sortLabel(provider.sortCriteria)),
                  avatar: Icon(
                    provider.sortAscending
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 16,
                  ),
                  onDeleted: () {
                    context
                        .read<TaskProvider>()
                        .setSortCriteria(SortCriteria.createdDate);
                  },
                  deleteIcon: const Icon(Icons.close, size: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTaskList(provider.tasks),
                _buildTaskList(provider.tasks.where((t) => !t.isDone).toList()),
                _buildTaskList(provider.tasks.where((t) => t.isDone).toList()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    if (tasks.isEmpty) {
      return const EmptyState();
    }

    return SingleChildScrollView(
      child: Column(
        children: tasks.map((task) {
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
        }).toList(),
      ),
    );
  }
}
