import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';

// PROCESSING, DONE, FAIL
class ColorUtils {
  ColorUtils._();
  static Color getColorByStatus(String status) {
    switch (status) {
      case 'PROCESSING':
        return AppColor.primaryColor;
      case 'DONE':
        return AppColor.green;
      case 'FAIL':
        return AppColor.red;
      default:
        return AppColor.backgroundColor;
    }
  }
}
