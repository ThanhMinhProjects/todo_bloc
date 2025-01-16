import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/widgets/date_progess_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: ColorUtils.getColorByStatus(task.status)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: ColorUtils.getColorByStatus(task.status).withOpacity(0.3),
              offset: const Offset(1, 1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            task.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.regular12,
          ),
          const SizedBox(height: 16.0),
          DateProgessWidget(
              status: task.status, itemSize: 12, date: task.createdAt)
        ],
      ),
    );
  }
}
