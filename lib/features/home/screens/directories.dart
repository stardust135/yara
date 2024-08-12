import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yara/config/routes/routes.dart';
import 'package:yara/core/constants/assets_path.dart';
import 'package:yara/core/constants/styles.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:yara/features/home/widgets/divider.dart';

import '../../../core/widgets/custom_list_tile.dart';

class Directories extends StatelessWidget {
  const Directories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          // sent messages
          CustomListTile(
            badge: Text(
              'بعد از ظهر 4:59',
              style: TextStyle(
                fontFamily: Styles.fonts.vazirMatn,
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(17),
              child: SvgPicture.asset(
                AssetPaths.icons.send,
              ),
            ),
            iconBackgroundColor: const Color(0xff76c84d),
            title: 'ارسال شده ها',
            description:
                'متن تستی شماره ۱ در حال اجرا شدن متن تستی شماره ۱ در حال اجرا شدن است متن تستی شماره ۱ در حال اجرا شدن است.',
          ),

          const MyDivider(),

          // deleted messages
          CustomListTile(
            badge: Text(
              'بعد از ظهر 4:59',
              style: TextStyle(
                fontFamily: Styles.fonts.vazirMatn,
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.all(17),
              child: SvgPicture.asset(
                AssetPaths.icons.delete,
              ),
            ),
            iconBackgroundColor: const Color(0xffe04b4b),
            title: 'حذف شده ها',
            description:
                'متن تستی شماره ۱ در حال اجرا شدن متن تستی شماره ۱ در حال اجرا شدن است متن تستی شماره ۱ در حال اجرا شدن است.',
          ),

          const MyDivider(),

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
            title: 'پرونده ویژه',
            description:
                'متن تستی شماره ۱ در حال اجرا شدن متن تستی شماره ۱ در حال اجرا شدن است متن تستی شماره ۱ در حال اجرا شدن است.',
          ),
          const MyDivider(),

          ListView.separated(
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.folder,
                    arguments: {
                      'title': 'استان ${index.toString()}',
                    },
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: CustomListTile(
                  icon: Padding(
                    padding: const EdgeInsets.all(17),
                    child: SvgPicture.asset(
                      AssetPaths.icons.folder,
                    ),
                  ),
                  iconBackgroundColor: const Color(0xff549cdd),
                  title: 'استان ${index.toString()}',
                  badge: statesBadgeCreator(42),
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) {
              return const MyDivider();
            },
          ),

          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget statesBadgeCreator(int number) {
    return Container(
      alignment: Alignment.center,
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Text(
        '$number',
        style: TextStyle(
          fontFamily: Styles.fonts.vazirMatn,
          color: Colors.white,
        ),
      ),
    );
  }
}
