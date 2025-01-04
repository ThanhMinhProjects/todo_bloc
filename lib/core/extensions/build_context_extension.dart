import 'package:flutter/material.dart';
import 'package:todo_bloc/core/navigation/navigation.dart';

extension BuildContextExtension on BuildContext {
  void navigateTo(String route, {Object? arguments}) {
    Navigation.navigateTo(route, arguments: arguments);
  }

  void goBack() {
    Navigation.goBack();
  }
}
