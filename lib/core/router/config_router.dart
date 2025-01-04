import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_bloc/core/router/app_router.dart';
import 'package:todo_bloc/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart';
import 'package:todo_bloc/features/register/presentation/screens/register_screen.dart';

class ConfigRouter {
  // GlobalKey cho Navigator
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.login,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: AppRouter.home,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRouter.login,
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<LoginBloc>(),
          child: LoginScreen(email: state.extra as String?),
        ),
      ),
      GoRoute(
        path: AppRouter.register,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<RegisterBloc>(),
          child: RegisterScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => Container(),
  );

  static void pushAndRemoveUtil(String path, {Object? extra}) {
    final currentContext = navigatorKey.currentContext;
    if (currentContext != null) {
      GoRouter.of(currentContext).go(path, extra: extra);
    } else {
      debugPrint('Error: Current context is null!');
    }
  }

  static void push(String path, {Object? extra}) {
    final currentContext = navigatorKey.currentContext;
    if (currentContext != null) {
      GoRouter.of(currentContext).push(path, extra: extra);
    } else {
      debugPrint('Error: Current context is null!');
    }
  }
}
