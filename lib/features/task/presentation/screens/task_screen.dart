import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/components/card/custom_card.dart';
import 'package:todo_bloc/core/components/progessbar/custom_circle_progessbar.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_dimension.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/task/data/model/overview_model.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/widgets/task_card_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    context.read<TaskBloc>().add(const InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColor.primaryColor,
              child: const Icon(
                Icons.add,
                color: AppColor.backgroundColor,
              ),
              onPressed: () =>
                  context.getNavigator.push(screenType: ScreenType.addTask),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingLarge,
                  vertical: AppDimension.paddingMedium),
              children: [
                _buildTaskOverView(),
                const SizedBox(height: AppDimension.marginMedium),
                _buildAllTask(state),
              ],
            ));
      },
    );
  }

  Widget _buildAllTask(TaskState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All task',
          style: AppStyle.semibold18,
        ),
        const SizedBox(height: AppDimension.marginSmall),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final task = state.tasks![index];
              return GestureDetector(
                  onTap: () async {
                    final result = await context.getNavigator.push(
                        screenType: ScreenType.taskDetail, arguments: task.id);
                    if (result == true) {
                      context.read<TaskBloc>().add(const InitialEvent());
                    }
                  },
                  child: TaskCardWidget(task: task));
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: state.tasks!.length),
      ],
    );
  }

  Widget _buildTaskOverView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: AppStyle.semibold18,
        ),
        const SizedBox(height: AppDimension.marginSmall),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: overviews.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3,
              mainAxisSpacing: AppDimension.marginSmall,
              crossAxisSpacing: AppDimension.marginSmall,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return CustomCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(overviews[index].iconPath, width: 30.0),
                  const SizedBox(width: 5),
                  Text(overviews[index].text,
                      style:
                          AppStyle.semibold14.copyWith(color: AppColor.black)),
                  const Spacer(),
                  CustomCircleProgessbar(
                    status: overviews[index].text,
                    minValue: 10,
                    maxValue: 90,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
