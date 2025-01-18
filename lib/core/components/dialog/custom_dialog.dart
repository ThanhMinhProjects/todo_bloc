import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.onPressedOk,
    this.titleText,
    this.bodyText,
    this.body,
    this.actions,
  });

  final void Function()? onPressedOk;
  final String? titleText;
  final String? bodyText;
  final Widget? body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: _buildTitle(),
      content: _buildContent(),
      actions: actions ?? _defaultActions(context),
    );
  }

  Widget? _buildTitle() {
    if (titleText == null || titleText!.isEmpty) return null;
    return Text(
      titleText!,
      style: AppStyle.semibold14.copyWith(color: AppColor.black),
    );
  }

  Widget _buildContent() {
    if (body != null) return body!;
    if (bodyText != null && bodyText!.isNotEmpty) {
      return Text(
        bodyText!,
        style: AppStyle.regular14,
      );
    }
    return const SizedBox.shrink();
  }

  List<Widget> _defaultActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => context.getNavigator.pop(),
        child: Text(
          'Cancel',
          style: AppStyle.regular14,
        ),
      ),
      TextButton(
        onPressed: onPressedOk,
        child: Text(
          'Ok',
          style: AppStyle.semibold14.copyWith(color: AppColor.red),
        ),
      ),
    ];
  }
}
