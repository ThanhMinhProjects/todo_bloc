import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/task/presentation/binding/task_binding.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/widgets/task_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: TaskBinding.generateBloc,
      child: TaskWidget(),
    );
  }
}
