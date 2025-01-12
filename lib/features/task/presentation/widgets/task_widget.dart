import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
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
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.getNavigator.push(screenType: ScreenType.addTask),
            ),
            drawer: Drawer(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Task'),
            ),
            body: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final sharePref = GetIt.I<SharePrefService>();
                      await sharePref.clearToken();
                    },
                    child: const Text('LogOut')),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final task = state.task[index];
                          return GestureDetector(
                            onTap: () {
                              context.getNavigator.push(
                                  screenType: ScreenType.taskDetail,
                                  arguments: task);
                            },
                            child: ListTile(
                              title: Text(task.name),
                              subtitle: Text(task.description),
                              trailing: Text(task.status),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemCount: state.task.length))
              ],
            ));
      },
    );
  }
}
