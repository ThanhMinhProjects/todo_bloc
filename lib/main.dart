import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/injection.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'features/todo/presentation/screens/todo_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => getIt<TodoBloc>(),
        child: TodoScreen(),
      ),
    );
  }
}
