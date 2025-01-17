import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';
import 'package:todo_bloc/core/utils/date_time_format.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/widgets/task_card_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
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
            key: _scaffoldState,
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
            drawer: Drawer(
                child: ListView(
              children: [
                IconButton(
                    onPressed: () => context
                        .read<AppBloc>()
                        .add(LogoutEvent('ntminh16201@gmail.com')),
                    icon: const Icon(Icons.logout))
              ],
            )),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => _scaffoldState.currentState?.openDrawer(),
                  icon: const Icon(Icons.menu)),
            ),
            body: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final task = state.tasks![index];
                          return GestureDetector(
                              onTap: () async {
                                final result = await context.getNavigator.push(
                                    screenType: ScreenType.taskDetail,
                                    arguments: task.id);
                                if (result == true) {
                                  context
                                      .read<TaskBloc>()
                                      .add(const InitialEvent());
                                }
                              },
                              child: TaskCardWidget(task: task));
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemCount: state.tasks!.length))
              ],
            ));
      },
    );
  }
}
