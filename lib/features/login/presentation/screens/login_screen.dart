import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/router/app_router.dart';
import 'package:todo_bloc/core/router/config_router.dart';
import 'package:todo_bloc/features/login/presentation/bloc/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email});
  final String? email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController(
      text: widget.email,
    );
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login'),
              const SizedBox(height: 20.0),
              CustomTextField(hintText: 'Email', controller: _emailController),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              CustomTextField(
                  hintText: 'Password', controller: _passwordController),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: () {}, child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    ConfigRouter.push(AppRouter.register);
                  },
                  child: const Text('Register')),
            ],
          ),
        ));
      },
    );
  }
}
