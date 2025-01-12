import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';

extension BuildContextExtension on BuildContext {
  AppNavigator get getNavigator => AppNavigator(this);

  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
}
