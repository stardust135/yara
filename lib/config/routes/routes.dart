import 'package:flutter/material.dart';
import 'package:yara/features/auth/screens/login.dart';
import 'package:yara/features/auth/screens/sms_verify.dart';
import 'package:yara/features/channel/screens/channel.dart';
import 'package:yara/features/folder/screens/folder.dart';
import 'package:yara/features/home/screens/home.dart';

import '../../screens_wrapper.dart';

class Routes {
  static const String screensWrapper = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String smsVerify = '/smsVerify';
  static const String folder = '/folder';
  static const String channel = '/channel';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case screensWrapper:
        return MaterialPageRoute(
          builder: (context) => const ScreensWrapper(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case smsVerify:
        return MaterialPageRoute(
          builder: (context) => SmsVerify(
            phoneNumber: (settings.arguments as Map)['phoneNumber'],
          ),
        );
      case folder:
        return MaterialPageRoute(
          builder: (context) => FolderScreen(
            title: (settings.arguments as Map)['title'],
          ),
        );
      case channel:
        return MaterialPageRoute(
          builder: (context) => Channel(
            title: (settings.arguments as Map)['title'],
          ),
        );
      default:
        throw const FormatException('Route not found!');
    }
  }
}
