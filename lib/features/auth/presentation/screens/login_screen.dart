import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email});
  final String? email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

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
    return BlocProvider(
      create: (_) => GetIt.I<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Login'),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
                      validator: Validator.isEmpty,
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Password',
                        controller: _passwordController,
                        validator: Validator.isEmpty),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LoginEvent(LoginBody(
                                email: _emailController.text,
                                password: _passwordController.text,
                              )));
                        },
                        child: const Text('Login')),
                    ElevatedButton(
                        onPressed: () => context.getNavigator
                            .push(screenType: ScreenType.register),
                        child: const Text('Register')),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
