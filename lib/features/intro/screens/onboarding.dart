import 'package:flutter/material.dart';
import 'package:yara/config/routes/routes.dart';
import 'package:yara/core/constants/assets_path.dart';
import 'package:yara/core/constants/styles.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:yara/locator.dart';

import '../../../core/widgets/my_elevated_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPaths.images.logo,
            height: 200,
          ),
          const SizedBox(height: 30),
          Text(
            'یارا',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: Styles.fonts.vazirMatn,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'دستیار پیام رسان شما',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
              fontFamily: Styles.fonts.vazirMatn,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: MyElevatedButton(
              onPressed: () {
                locator.dbManager.setOnboardingShown(true);
                if (locator.dbManager.userLoggedIn ?? false) {
                  context.pushReplacementName(Routes.login);
                } else {
                  context.pushReplacementName(Routes.home);
                }
              },
              overlayColor: Colors.green.shade700,
              borderRedius: 8,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 8,
              ),
              textColor: Colors.white,
              backgroundColor: const Color(0xff337c67),
              elevation: 4,
              content: Text(
                'شروع پیام رسانی',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: Styles.fonts.vazirMatn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
