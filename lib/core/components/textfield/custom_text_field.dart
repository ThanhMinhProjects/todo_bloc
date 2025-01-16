import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      this.prefixIcon,
      this.isPassword = false,
      this.onChanged,
      this.maxLines});
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool isPassword;
  final void Function(String)? onChanged;
  final int? maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isShowPassword,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColor.red,
              width: 1.0,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.primaryColor)),
        hintText: widget.hintText,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                child: Icon(isShowPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))
            : null,
        fillColor: Colors.grey[300],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
