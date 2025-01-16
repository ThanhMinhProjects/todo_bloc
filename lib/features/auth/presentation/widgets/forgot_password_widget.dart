import 'package:flutter/material.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';

class ForgotPasswordNavigationWidget extends StatelessWidget {
  const ForgotPasswordNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.getNavigator.push(screenType: ScreenType.forgotPassword),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot Password',
            style: TextStyle(color: AppColor.primaryColor, fontSize: 12),
          ),
          Icon(
            Icons.arrow_forward_sharp,
            size: 12,
            color: AppColor.primaryColor,
          )
        ],
      ),
    );
  }
}
