import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/task_provider.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? taskToEdit;

  const AddTaskScreen({super.key, this.taskToEdit});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Priority _selectedPriority = Priority.normal;
  DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    if (widget.taskToEdit != null) {
      _titleController.text = widget.taskToEdit!.title;
      _descriptionController.text = widget.taskToEdit!.description;
      _selectedPriority = widget.taskToEdit!.priority;
      _selectedDueDate = widget.taskToEdit!.dueDate;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDueDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365 * 2)),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDueDate ?? now),
    );

    setState(() {
      _selectedDueDate = time == null
          ? date
          : DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} à ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        id: widget.taskToEdit?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        isDone: widget.taskToEdit?.isDone ?? false,
        priority: _selectedPriority,
        dueDate: _selectedDueDate,
      );

      if (widget.taskToEdit == null) {
        await context.read<TaskProvider>().addTask(task);
      } else {
        await context.read<TaskProvider>().updateTask(task);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.taskToEdit == null ? 'Nouvelle tâche' : 'Modifier la tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                autofocus: widget.taskToEdit == null,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Titre *',
                  hintText: 'Ex. Faire les courses',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.task_alt),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le titre est obligatoire';
                  }
                  if (value.trim().length < 3) {
                    return 'Le titre doit comporter au moins 3 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Description (optionnelle)',
                  hintText: 'Précisez si nécessaire...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notes),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<Priority>(
                value: _selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Priorité',
                  prefixIcon: Icon(Icons.flag),
                ),
                items: const [
                  DropdownMenuItem(value: Priority.low, child: Text('Basse')),
                  DropdownMenuItem(
                      value: Priority.normal, child: Text('Normale')),
                  DropdownMenuItem(value: Priority.high, child: Text('Haute')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedPriority = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(
                  _selectedDueDate == null
                      ? "Aucune date d'échéance"
                      : "Échéance : ${_formatDate(_selectedDueDate!)}",
                ),
                trailing: _selectedDueDate != null
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () =>
                            setState(() => _selectedDueDate = null),
                      )
                    : null,
                onTap: _pickDueDate,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(widget.taskToEdit == null
                      ? 'Ajouter la tâche'
                      : 'Enregistrer les modifications'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
