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

class TaskDetailScreens extends StatefulWidget {
  const TaskDetailScreens({super.key, required this.id});
  final String id;

  @override
  State<TaskDetailScreens> createState() => _TaskDetailScreensState();
}

class _TaskDetailScreensState extends State<TaskDetailScreens> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(GetTaskDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Task detail',
        onBack: () => context.getNavigator.pop(result: true),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            children: [
              Text(
                state.task?.name ?? '--:--',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              ReadMoreText(
                state.task?.description ?? '',
                style: AppStyle.regular18,
                trimMode: TrimMode.Line,
                trimLines: 10,
                colorClickableText: AppColor.primaryColor,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10.0),
              DateProgessWidget(
                  status: state.task?.status ?? 'DONE',
                  itemSize: 18,
                  date: state.task?.createdAt ?? DateTime.now()),
              const SizedBox(height: 24.0),
              Row(children: [
                Expanded(
                    child: CustomButton(
                  onPressed: () async {
                    if (await confirm(
                      context,
                      title: const Text('Confirm'),
                      content:
                          const Text('Would you like to delete this task?'),
                      textOK: Text(
                        'Yes',
                        style:
                            AppStyle.semibold14.copyWith(color: AppColor.red),
                      ),
                      textCancel: Text('No', style: AppStyle.semibold14),
                    )) {
                      context.read<TaskBloc>().add(DeleteTaskEvent(widget.id));
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
                        onPressed: () async {
                          final shouldReload = await context.getNavigator.push(
                              screenType: ScreenType.taskUpdate,
                              arguments: state.task);
                          if (shouldReload == true) {
                            context
                                .read<TaskBloc>()
                                .add(GetTaskDetailEvent(widget.id));
                          }
                        },
                        text: 'Update')),
              ]),
            ],
          );
        },
      ),
    );
  }
}
