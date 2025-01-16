import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/components/appbar/custom_appbar.dart';
import 'package:todo_bloc/core/components/buttons/custom_button.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Create task'),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Task name',
                  validator: Validator.isEmpty,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Description',
                  validator: Validator.isEmpty,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<TaskBloc>().add(
                              CreateTaskEvent(
                                TaskBody(
                                  name: _nameController.text,
                                  description: _descriptionController.text,
                                  status: 'PROCESSING',
                                ),
                              ),
                            );
                      }
                    },
                    text: 'Create')
              ],
            ),
          );
        },
      ),
    );
  }
}
