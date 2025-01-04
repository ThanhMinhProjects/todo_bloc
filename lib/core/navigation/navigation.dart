import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_bloc/core/router/app_router.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/register/presentation/screens/register_screen.dart';

@Singleton()
class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void navigateTo(
    String route, {
    Object? arguments,
    PageTransitionType type = PageTransitionType.rightToLeft,
    int duration = 300,
  }) {
    _navigate(
      route,
      arguments: arguments,
      type: type,
      duration: duration,
      isRemoveUntil: false,
    );
  }

  static void navigateToAndRemoveUntil(
    String route, {
    Object? arguments,
    PageTransitionType type = PageTransitionType.rightToLeft,
    int duration = 300,
  }) {
    _navigate(
      route,
      arguments: arguments,
      type: type,
      duration: duration,
      isRemoveUntil: true,
    );
  }

  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  static void _navigate(String route,
      {Object? arguments,
      PageTransitionType type = PageTransitionType.rightToLeft,
      int duration = 300,
      bool isRemoveUntil = false}) {
    final page = _getRoutePage(route, arguments);
    final transition = _getPageTransition(type, page, duration);

    if (isRemoveUntil) {
      navigatorKey.currentState?.pushAndRemoveUntil(
        transition,
        (route) => false,
      );
    } else {
      navigatorKey.currentState?.push(transition);
    }
  }

  static PageTransition _getPageTransition(
    PageTransitionType type,
    Widget page,
    int duration,
  ) {
    return PageTransition(
      type: type,
      child: page,
      duration: Duration(milliseconds: duration),
    );
  }

  static Widget _getRoutePage(String routeName, Object? arguments) {
    final routeMap = {
      AppRouter.home: Container(),
      AppRouter.login: const LoginScreen(),
      AppRouter.register: const RegisterScreen(),
      AppRouter.profile: Container(),
    };

    return routeMap[routeName] ?? Container();
  }
}
