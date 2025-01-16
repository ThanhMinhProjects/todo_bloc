import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColor.primaryColor,
    this.foregroundColor = AppColor.backgroundColor,
    this.boderColor = AppColor.backgroundColor,
  });
  const CustomButton.outline({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor = AppColor.backgroundColor,
    this.foregroundColor = AppColor.primaryColor,
    this.boderColor = AppColor.primaryColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color boderColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            minimumSize: const Size(double.infinity, 48.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: AppColor.primaryColor))),
        onPressed: onPressed,
        child: Text(text.toUpperCase()));
  }
}
