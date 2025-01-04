import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_bloc/core/di/injection.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:get_it/get_it.dart';

void main() {
  configureDependencies(); // Khởi tạo DI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey =
        getIt<GlobalKey<NavigatorState>>(); // Lấy GlobalKey từ GetIt

    return MaterialApp(
      navigatorKey: navigatorKey, // Liên kết GlobalKey với MaterialApp
      home: const LoginScreen(), // Màn hình mặc định
      builder: EasyLoading.init(),
    );
  }
}
