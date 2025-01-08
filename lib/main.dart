import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/di/injection.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/local/share_pref_service.dart';
import 'package:todo_bloc/features/app/presentation/app.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(App());
}
