import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/core/components/appbar/custom_appbar.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';

class TaskUpdateScreen extends StatefulWidget {
  const TaskUpdateScreen({super.key, required this.task});
  final TaskEntity task;

  @override
  State<TaskUpdateScreen> createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends State<TaskUpdateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _status = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.task.name;
    _descriptionController.text = widget.task.description;
    _status = widget.task.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Update task'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: 'Task name',
            ),
            const SizedBox(height: 24.0),
            CustomTextField(
              controller: _descriptionController,
              hintText: 'Task name',
            ),
            const SizedBox(height: 24.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              value: _status,
              hint: const Text('Status'),
              items: const [
                DropdownMenuItem(
                  value: 'PROCESSING',
                  child: Text('PROCESSING'),
                ),
                DropdownMenuItem(
                  value: 'DONE',
                  child: Text('DONE'),
                ),
                DropdownMenuItem(
                  value: 'FAIL',
                  child: Text('FAIL'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _status = value!;
                });
              },
            ),
            const SizedBox(height: 24.0),
            Text(
                'Created: ${DateTimeFormat.formatDDYYMM(widget.task.createdAt)}'),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => context
                          .read<TaskBloc>()
                          .add(DeleteTaskEvent(widget.task.id)),
                      child: const Text('Delete'))),
              const SizedBox(width: 24.0),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<TaskBloc>().add(UpdateTaskEvent(
                              TaskBody(
                                  name: _nameController.text,
                                  description: _descriptionController.text,
                                  status: _status),
                              widget.task.id));
                        }
                      },
                      child: const Text('Up date'))),
            ]),
          ],
        ),
      ),
    );
  }
}
