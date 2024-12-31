import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show(status: 'loading...');
        } else {
          EasyLoading.dismiss();
        }
        if (state.errorMessage!.isNotEmpty) {
          EasyLoading.showError(state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Register'),
              const SizedBox(height: 20.0),
              Text('OTP: ${state.otpMessage}'),
              const SizedBox(height: 20.0),
              TextField(controller: _emailController),
              const SizedBox(height: 20.0),
              Row(children: [
                Expanded(child: TextField(controller: _otpController)),
                TextButton(
                    onPressed: () {
                      context.read<RegisterBloc>().add(SendOtpEvent(
                          SendOtpBody(email: _emailController.text.trim())));
                    },
                    child: const Text('Send Otp'))
              ]),
              const SizedBox(height: 20.0),
              TextField(controller: _passwordController),
              const SizedBox(height: 20.0),
              TextField(controller: _confirmPasswordController),
              const SizedBox(height: 20.0),
              ElevatedButton(onPressed: () {}, child: const Text('Register'))
            ],
          ),
        ));
      },
    );
  }
}
