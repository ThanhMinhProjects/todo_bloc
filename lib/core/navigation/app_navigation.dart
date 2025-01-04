import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:page_transition/page_transition.dart';

class AppNavigator {
  AppNavigator({required this.current});
  final NavigatorState current;
  Future<void> push({
    required ScreenType screenType,
    Map<String, dynamic>? arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    current.push(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
    );
  }

  Future<void> replace({
    required ScreenType screenType,
    Map<String, dynamic>? arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    current.pushReplacement(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
    );
  }

  Future<void> pushAndRemoveUntil({
    required ScreenType screenType,
    Map<String, dynamic>? arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    current.pushAndRemoveUntil(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
      (route) => false,
    );
  }

  void pop() {
    current.pop();
  }
}
