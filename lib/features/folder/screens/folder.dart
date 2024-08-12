import 'package:flutter/material.dart';
import 'package:yara/config/routes/routes.dart';
import 'package:yara/core/constants/styles.dart';
import 'package:yara/core/utils/extensions.dart';

import '../../../core/widgets/custom_list_tile.dart';
import '../../home/widgets/divider.dart';

class FolderScreen extends StatelessWidget {
  final String title;

  const FolderScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff337c67),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: Styles.fonts.vazirMatn,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                const SizedBox(height: 15),
                ListView.separated(
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.pushNamed(
                          Routes.channel,
                          arguments: {
                            'title': index.toString(),
                          },
                        );
                      },
                      child: CustomListTile(
                        badge: Text(
                          'بعد از ظهر 4:59',
                          style: TextStyle(
                            fontFamily: Styles.fonts.vazirMatn,
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                        iconBackgroundColor: Colors.white,
                        title: 'قم ما',
                        description:
                            'متن تستی شماره ۱ در حال اجرا شدن متن تستی شماره ۱ در حال اجرا شدن است متن تستی شماره ۱ در حال اجرا شدن است.',
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
          ),
        ),
      ),
    );
  }
}
