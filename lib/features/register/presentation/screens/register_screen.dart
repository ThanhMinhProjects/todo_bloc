import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart';
import 'package:todo_bloc/features/register/presentation/widgets/register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RegisterBloc>(),
      child: RegisterWidget(),
    );
  }
}
