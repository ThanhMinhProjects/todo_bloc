import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_bloc/core/di/injection.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = getIt<GlobalKey<NavigatorState>>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
