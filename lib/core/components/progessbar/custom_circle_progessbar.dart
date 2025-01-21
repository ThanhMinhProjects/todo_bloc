import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';

class CustomCircleProgessbar extends StatelessWidget {
  const CustomCircleProgessbar(
      {super.key, required this.status, this.minValue = 1, this.maxValue = 1});
  final String status;
  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
              value: minValue / maxValue,
              strokeWidth: 2.5,
              backgroundColor:
                  ColorUtils.getColorByStatus(status).withOpacity(0.4),
              color: ColorUtils.getColorByStatus(status)),
          FittedBox(
              child: Text('$minValue/$maxValue',
                  style: AppStyle.semibold8.copyWith(color: AppColor.black)))
        ],
      ),
    );
  }
}
