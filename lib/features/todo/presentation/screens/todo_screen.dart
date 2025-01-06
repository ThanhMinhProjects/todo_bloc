import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/services/local/share_pref_service.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sharePref = GetIt.I<SharePrefService>();
    return Scaffold(
      body: FutureBuilder(
        future: sharePref.getToken(),
        builder: (context, snapshot) => Center(
          child: Text(snapshot.data ?? ''),
        ),
      ),
    );
  }
}
