import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/core/components/appbar/custom_appbar.dart';
import 'package:todo_bloc/core/components/buttons/custom_button.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/widgets/status_dropdown_widget.dart';

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
    super.initState();
    _nameController.text = widget.task.name;
    _descriptionController.text = widget.task.description;
    _status = widget.task.status;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<TaskBloc>().add(UpdateTaskEvent(
          TaskBody(
            name: _nameController.text,
            description: _descriptionController.text,
            status: _status,
          ),
          widget.task.id));
    }
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
              hintText: 'Task description',
              maxLines: 10,
            ),
            const SizedBox(height: 24.0),
            StatusDropdownWidget(
              initialStatus: _status,
              onStatusChanged: (value) {
                setState(() {
                  _status = value;
                });
              },
            ),
            const SizedBox(height: 24.0),
            CustomButton(
              onPressed: _onSubmit,
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
