import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yara/core/repositories/settings_manage.dart';
import '../core/repositories/db_manager.dart';
import 'core/repositories/api_manager.dart';
import 'core/repositories/app_repository.dart';

/// This file is responsible for injecting the dependencies of the project

GetIt locator = GetIt.instance;
final logger = Logger();

setupLocator() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<AppRepository>(AppRepository());
  locator.registerSingleton<ApiManager>(ApiManager());
  locator.registerSingleton<DbManager>(DbManager());
  locator.registerSingleton<SettingsManager>(SettingsManager());
}
