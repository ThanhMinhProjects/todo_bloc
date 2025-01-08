import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
