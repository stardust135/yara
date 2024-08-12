import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets_path.dart';
import '../constants/styles.dart';
import 'bubble_shape.dart';

class MessageShape extends StatelessWidget {
  const MessageShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 100,
            minWidth: 250,
          ),
          child: Expanded(
            child: Stack(
              children: [
                BubbleShape(
                  bubbleNip: BubbleNip.leftBottom,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'محمد مهدی هوشیاری',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: Styles.fonts.vazirMatn,
                            color: const Color(0xff34A5CA),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'If stick set to false the right offset of bubble equal to the offset from the left, not taking into account the size of the nip. This allows the bubbles to line up. If stick set to true, the far side will be stick to the edge.',
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'بعد از ظهر 5:35',
                        // textAlign: TextAlign.end,
                        // textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: Styles.fonts.vazirMatn,
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Transform.translate(
                    offset: const Offset(0, 42),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetPaths.icons.deleteLinks),
                        const SizedBox(width: 10),
                        SvgPicture.asset(AssetPaths.icons.deleteHashTags),
                        const SizedBox(width: 10),
                        SvgPicture.asset(AssetPaths.icons.editTemplate),
                        const SizedBox(width: 10),
                        SvgPicture.asset(AssetPaths.icons.deleteEmojis),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Transform.translate(
                    offset: const Offset(35, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AssetPaths.icons.editText),
                        const SizedBox(height: 10),
                        SvgPicture.asset(AssetPaths.icons.forward),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -10),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
