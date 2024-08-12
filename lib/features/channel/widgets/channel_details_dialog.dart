import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';
import '../../../core/widgets/custom_dialog.dart';

class ChannelDetailsDialog extends StatelessWidget {
  final String title;

  const ChannelDetailsDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CustomDialog(
        insetPadding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320, maxHeight: 520),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff337c67),
                title: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.shade300,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: Styles.fonts.vazirMatn,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                automaticallyImplyLeading: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // description
                    Text(
                      'توضیحات',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: Styles.fonts.vazirMatn,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const Center(),
                    const Divider(),
                    Text(
                      'کانال های رصد',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: Styles.fonts.vazirMatn,
                        color: Colors.green.shade700,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 350,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 25,
                            children: List.generate(
                              50,
                              (index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {},
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      index.toString(),
                                      style: TextStyle(
                                        fontFamily: Styles.fonts.vazirMatn,
                                        color: Colors.black,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
