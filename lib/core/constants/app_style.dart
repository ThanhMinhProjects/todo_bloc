// FontWeight.w100: Thin
// FontWeight.w200: Extra Light
// FontWeight.w300: Light
// FontWeight.w400: Regular (normal)
// FontWeight.w500: Medium
// FontWeight.w600: Semi Bold
// FontWeight.w700: Bold
// FontWeight.w800: Extra Bold
// FontWeight.w900: Black (Ultra Bold)
import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';

class AppStyle {
  AppStyle._();
  static TextStyle semibold14 = const TextStyle(
      color: AppColor.primaryColor, fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle regular12 = const TextStyle(
      color: AppColor.black, fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle regular14 = const TextStyle(
      color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle regular18 = const TextStyle(
      color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w400);
  static TextStyle bold48 =
      const TextStyle(fontSize: 48, fontWeight: FontWeight.bold);
}
