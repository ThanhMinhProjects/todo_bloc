import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_bloc/core/navigation/navigation.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:todo_bloc/core/di/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigation.navigatorKey,
      builder: EasyLoading.init(),
      home: const LoginScreen(),
    );
  }
}
