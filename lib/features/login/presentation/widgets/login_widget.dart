import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/core/router/app_router.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/login/presentation/bloc/bloc/login_bloc.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              TextField(controller: _emailController),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              TextField(controller: _passwordController),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: () {}, child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    context.navigateTo(AppRouter.register);
                  },
                  child: const Text('Register')),
            ],
          ),
        ));
      },
    );
  }
}
