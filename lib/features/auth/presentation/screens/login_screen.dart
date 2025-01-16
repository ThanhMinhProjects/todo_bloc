import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/components/buttons/custom_button.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:todo_bloc/features/auth/presentation/widgets/register_now_widget.dart';
import 'package:todo_bloc/gen/assets.gen.dart';

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
                  Image.asset(Assets.images.logo.path),
                  Text('Login', style: AppStyle.bold48),
                  const SizedBox(height: 48.0),
                  CustomTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    validator: Validator.isEmpty,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                      validator: Validator.isEmpty),
                  const SizedBox(height: 5),
                  const ForgotPasswordNavigationWidget(),
                  const SizedBox(height: 48.0),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(LoginEvent(LoginBody(
                              email: _emailController.text,
                              password: _passwordController.text,
                            )));
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(height: 24.0),
                  const RegisterNowWidget()
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
