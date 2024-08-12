import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/assets_path.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widgets/custom_list_tile.dart';
import '../widgets/divider.dart';


class OurIran extends StatelessWidget {
  const OurIran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        CustomListTile(
          badge: Text(
            'بعد از ظهر 4:59',
            style: TextStyle(
              fontFamily: Styles.fonts.vazirMatn,
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          iconBackgroundColor: Colors.white,
          title: 'ایران ما',
          description:
          'متن تستی شماره ۱ در حال اجرا شدن متن تستی شماره ۱ در حال اجرا شدن است متن تستی شماره ۱ در حال اجرا شدن است.',
        ),

        const MyDivider(),

        const SizedBox(height: 15),
      ],
    );
  }
}
