import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/main/presentation/bloc/main_bloc.dart';
import 'package:todo_bloc/features/main/presentation/widgets/drawer_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => _scaffoldState.currentState?.openDrawer(),
            icon: const Icon(Icons.menu)),
      ),
      body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) =>
              ScreenTypeHelper.getPage(state.screenType)),
    );
  }
}
