import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/components/appbar/custom_appbar.dart';
import 'package:todo_bloc/core/components/buttons/custom_button.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/forgot_password_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show(status: 'loading...');
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: const CustomAppbar(title: 'Forgot password'),
              body: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    Text('OTP: ${state.otpMessage}'),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      validator: Validator.isEmail,
                    ),
                    const SizedBox(height: 20.0),
                    Row(children: [
                      Expanded(
                          child: CustomTextField(
                        controller: _otpController,
                        hintText: 'OTP',
                        validator: Validator.isOtp,
                      )),
                      TextButton(
                          onPressed: _emailController.text.isNotEmpty
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(SendOtpEvent(
                                        SendOtpBody(
                                            email:
                                                _emailController.text.trim())));
                                  }
                                }
                              : null,
                          child: const Text('Send Otp'))
                    ]),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      validator: Validator.isPassword,
                    ),
                    const SizedBox(height: 20.0),
                    CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(ForgotPasswordEvent(
                                ForgotPasswordBody(
                                    code: _otpController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password:
                                        _passwordController.text.trim())));
                          }
                        },
                        text: 'Submit')
                  ],
                ),
              )),
        );
      },
    );
  }
}
