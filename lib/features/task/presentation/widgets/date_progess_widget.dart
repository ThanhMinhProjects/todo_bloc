import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';

class DateProgessWidget extends StatelessWidget {
  const DateProgessWidget(
      {super.key,
      required this.date,
      required this.status,
      required this.itemSize});
  final DateTime date;
  final String status;
  final double itemSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: itemSize,
          color: ColorUtils.getColorByStatus(status),
        ),
        Text(DateTimeFormat.formatDDYYMM(date),
            style: AppStyle.regular12.copyWith(color:  ColorUtils.getColorByStatus(status))),
        const Spacer(),
        const SizedBox(width: 10),
        _buildStatusBox(),
      ],
    );
  }

  Widget _buildStatusBox() {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: ColorUtils.getColorByStatus(status),
        ),
        child: Text(
          status,
          style: AppStyle.regular12
              .copyWith(color: AppColor.backgroundColor, fontSize: itemSize),
        ));
  }
}
