import 'package:flutter/material.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:yara/core/widgets/custom_dialog.dart';
import 'package:yara/locator.dart';

import '../../../core/constants/styles.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool shouldPined = false;

  bool shouldSigned = false;

  @override
  void initState() {
    setState(() {
      shouldPined = locator.settings.messageShouldBePined;
      shouldSigned = locator.settings.messageShouldBeSigned;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 190),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  'سنجاق شدن',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: Styles.fonts.vazirMatn,
                  ),
                ),
                trailing: Switch(
                  value: shouldPined,
                  onChanged: (bool value) {
                    setState(() {
                      shouldPined = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'امضا',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: Styles.fonts.vazirMatn,
                  ),
                ),
                trailing: Switch(
                  value: shouldSigned,
                  onChanged: (bool value) {
                    setState(() {
                      shouldSigned = value;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  locator.settings.setMessagePinState(shouldPined);
                  locator.settings.setMessageSignState(shouldSigned);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'اعمال',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Styles.fonts.vazirMatn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
