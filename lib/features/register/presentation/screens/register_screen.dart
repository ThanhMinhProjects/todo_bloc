import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/core/utils/validator.dart';
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
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
              body: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(24.0),
                children: [
                  const Text('Register'),
                  const SizedBox(height: 20.0),
                  Text('OTP: ${state.otpMessage}'),
                  const SizedBox(height: 20.0),
                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Name',
                    validator: Validator.isEmpty,
                  ),
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
                                context.read<RegisterBloc>().add(SendOtpEvent(
                                    SendOtpBody(
                                        email: _emailController.text.trim())));
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
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm password',
                    validator: (p0) => Validator.isConfirmPassword(
                        _passwordController.text, p0!),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        context.read<RegisterBloc>().add(SubmitRegisterEvent(
                            RegisterBody(
                                age: 0,
                                name: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                code: _otpController.text.trim())));
                      },
                      child: const Text('Register'))
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
