import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/components/appbar/custom_appbar.dart';
import 'package:todo_bloc/core/components/buttons/custom_button.dart';
import 'package:todo_bloc/core/components/textfield/custom_text_field.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/widgets/date_progess_widget.dart';
import 'package:readmore/readmore.dart';

class TaskDetailScreens extends StatelessWidget {
  const TaskDetailScreens({super.key, required this.task});
  final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Task detail'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        children: [
          Text(
            task.name,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            task.description,
            style: AppStyle.regular18,
            trimMode: TrimMode.Line,
            trimLines: 10,
            colorClickableText: AppColor.primaryColor,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          DateProgessWidget(
              status: task.status, itemSize: 18, date: task.createdAt),
          const SizedBox(height: 24.0),
          Row(children: [
            Expanded(
                child: CustomButton(
              onPressed: () async {
                if (await confirm(
                  context,
                  title: const Text('Confirm'),
                  content: const Text('Would you like to delete this task?'),
                  textOK: Text(
                    'Yes',
                    style: AppStyle.semibold14.copyWith(color: AppColor.red),
                  ),
                  textCancel: Text('No', style: AppStyle.semibold14),
                )) {
                  context.read<TaskBloc>().add(DeleteTaskEvent(task.id));
                }
              },
              text: 'Delete',
              backgroundColor: AppColor.red,
              boderColor: AppColor.red,
              foregroundColor: AppColor.backgroundColor,
            )),
            const SizedBox(width: 24.0),
            Expanded(
                child: CustomButton(
                    onPressed: () => context.getNavigator.push(
                        screenType: ScreenType.taskUpdate, arguments: task),
                    text: 'Update')),
          ]),
        ],
      ),
    );
  }
}
