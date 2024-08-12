import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../repositories/api_manager.dart';
import '../../locator.dart';
import '../repositories/db_manager.dart';
import '../repositories/settings_manage.dart';

extension NavigationExtension on BuildContext {
  pushNamed(String routeName, {dynamic arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  pushReplacementName(String routeName, {dynamic arguments}) =>
      Navigator.pushReplacementNamed(
        this,
        routeName,
      );
}

extension GetInstantExtension on GetIt {
  ApiManager get apiManager => locator<ApiManager>();
  DbManager get dbManager => locator<DbManager>();
  SettingsManager get settings => locator<SettingsManager>();
}
