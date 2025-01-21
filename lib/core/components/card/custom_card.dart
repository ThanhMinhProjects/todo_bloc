import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_dimension.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.boxShadow,
      this.padding,
      this.borderRadius,
      this.width,
      this.height});
  final Widget child;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: AppDimension.paddingMedium),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.backgroundColor,
          boxShadow: boxShadow ??
              const [
                BoxShadow(
                    color: AppColor.grey, offset: Offset(1, 1), blurRadius: 2.0)
              ],
          borderRadius: borderRadius ??
              BorderRadius.circular(
                AppDimension.borderRadiusMedium,
              )),
      child: child,
    );
  }
}
