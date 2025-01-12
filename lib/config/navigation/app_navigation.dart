import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:page_transition/page_transition.dart';

class AppNavigator {
  final BuildContext context;

  AppNavigator(this.context);
  Future<Object?> push({
    required ScreenType screenType,
    dynamic arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    return Navigator.of(context).push(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
    );
  }

  Future<Object?> replace({
    required ScreenType screenType,
    dynamic arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    return Navigator.of(context).pushReplacement(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
    );
  }

  Future<Object?> pushAndRemoveUntil({
    required ScreenType screenType,
    dynamic arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    return Navigator.of(context).pushAndRemoveUntil(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
      (route) => false,
    );
  }

  void pop() {
    return Navigator.of(context).pop();
  }
}
