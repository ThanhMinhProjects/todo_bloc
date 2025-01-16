import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/features/auth/presentation/widgets/forgot_password_widget.dart';

class RegisterNowWidget extends StatelessWidget {
  const RegisterNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyle.regular12,
        children: [
          const TextSpan(
              text: 'You do not have an account? ',
              style: TextStyle(
                  color: AppColor.black, fontWeight: FontWeight.w300)),
          TextSpan(
              text: 'Register now',
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    context.getNavigator.push(screenType: ScreenType.register)),
        ],
      ),
    );
  }
}
