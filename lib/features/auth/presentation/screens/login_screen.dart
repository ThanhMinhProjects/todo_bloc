import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.email});
  final String? email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = widget.email ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
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
                  ElevatedButton(
                      onPressed: () async {
                        final sharePref = GetIt.I<SharePrefService>();
                        await sharePref.clearToken();
                        final token = await sharePref.getToken();
                        print('token123token123$token');
                      },
                      child: const Text('Clear token')),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      validator: Validator.isEmpty),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LoginEvent(LoginBody(
                                email: _emailController.text,
                                password: _passwordController.text,
                              )));
                        }
                      },
                      child: const Text('Login')),
                  ElevatedButton(
                      onPressed: () => context.getNavigator
                          .push(screenType: ScreenType.register),
                      child: const Text('Register')),
                  ElevatedButton(
                      onPressed: () => context.getNavigator
                          .push(screenType: ScreenType.forgotPassword),
                      child: const Text('Forgot password')),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
