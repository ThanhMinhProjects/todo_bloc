import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/extensions/build_context_extension.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/local/share_pref_service.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sharePref = GetIt.I<SharePrefService>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              context.getNavigator.push(screenType: ScreenType.addTodo),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final sharePref = GetIt.I<SharePrefService>();
                  await sharePref.clearToken();
                  // ignore: use_build_context_synchronously
                  context.getNavigator
                      .pushAndRemoveUntil(screenType: ScreenType.login);
                },
                child: const Text('LogOut'))
          ],
        ));
  }
}
