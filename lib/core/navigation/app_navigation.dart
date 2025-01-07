import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:page_transition/page_transition.dart';

@Injectable()
class AppNavigator {
  final GlobalKey<NavigatorState> navigateKey;

  AppNavigator({required this.navigateKey});

  Future<Object?> push({
    required ScreenType screenType,
    dynamic arguments,
    PageTransitionType transitionType = PageTransitionType.rightToLeft,
  }) async {
    return navigateKey.currentState?.push(
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
    return navigateKey.currentState?.pushReplacement(
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
    return navigateKey.currentState?.pushAndRemoveUntil(
      PageTransition(
        type: transitionType,
        child: ScreenTypeHelper.getPage(screenType, arguments: arguments),
      ),
      (route) => false,
    );
  }

  void pop() {
    return navigateKey.currentState?.pop();
  }
}
