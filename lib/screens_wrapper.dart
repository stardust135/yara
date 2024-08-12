import 'package:flutter/material.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:yara/features/auth/screens/login.dart';
import 'package:yara/features/home/screens/home.dart';
import 'package:yara/features/intro/screens/onboarding.dart';
import 'package:yara/locator.dart';

class ScreensWrapper extends StatelessWidget {
  const ScreensWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    logger.e(locator.dbManager.onboardingShown);
    return const Scaffold(
      body: Login(),
    );
  }

  bodyCreator() {
    if ((locator.dbManager.onboardingShown ?? false) == false) {
      return const Onboarding();
    } else if ((locator.dbManager.userLoggedIn ?? false) == false) {
      return const Login();
    }
    return const HomeScreen();
  }
}
