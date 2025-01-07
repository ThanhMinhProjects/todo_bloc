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
      body: FutureBuilder(
        future: sharePref.getToken(),
        builder: (context, snapshot) => Center(
          child: Text(snapshot.data ?? ''),
        ),
      ),
    );
  }
}
