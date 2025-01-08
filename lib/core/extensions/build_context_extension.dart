import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';

extension BuildContextExtension on BuildContext {
  AppNavigator get getNavigator => GetIt.I<AppNavigator>();
}
