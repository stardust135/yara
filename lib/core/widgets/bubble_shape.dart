import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class BubbleShape extends StatelessWidget {
  final Widget child;
  final BubbleNip bubbleNip;

  const BubbleShape({
    super.key,
    required this.child,
    required this.bubbleNip,
  });

  @override
  Widget build(BuildContext context) {
    const styleSomebody = BubbleStyle(
      nip: BubbleNip.leftCenter,
      color: Colors.white,
      borderColor: Colors.blue,
      borderWidth: 1,
      elevation: 4,
      margin: BubbleEdges.only(top: 8, right: 50),
      alignment: Alignment.topLeft,
    );

    const styleMe = BubbleStyle(
      alignment: Alignment.topLeft,
      // nip: BubbleNip.leftCenter,
      color: Colors.white,
      borderColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black26,
      borderWidth: 1,
      margin: BubbleEdges.only(top: 8, left: 50),
    );
    return Bubble(
      style: styleMe,
      nip: bubbleNip,
      alignment: Alignment.bottomLeft,
      // padding: BubbleEdges.all(0),
      margin: const BubbleEdges.all(0),
      child: child,
    );
  }
}
