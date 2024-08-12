import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yara/core/constants/styles.dart';

class CustomListTile extends StatelessWidget {
  final Color iconBackgroundColor;
  final String title;
  final String? description;
  final Widget? icon;
  final Widget? badge;

  const CustomListTile({
    super.key,
    this.icon,
    this.badge,
    this.description,
    required this.title,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Expanded(
        child: Row(
          children: [
            // icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: icon == null ? Colors.black : Colors.transparent,
                  width: 0.5,
                ),
                color: iconBackgroundColor,
              ),
              child: icon,
            ),

            const SizedBox(width: 10),

            // content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: Styles.fonts.vazirMatn,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      if (badge != null) badge!,
                    ],
                  ),
                  // description
                  if (description != null)
                    SizedBox(
                      height: 20,
                      child: Text(
                        description!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: Styles.fonts.vazirMatn,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
