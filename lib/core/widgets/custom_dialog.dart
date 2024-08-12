import 'package:flutter/material.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

class CustomDialog extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? insetPadding;

  const CustomDialog({
    super.key,
    required this.child,
    this.insetPadding,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      insetPadding: insetPadding ?? _defaultInsetPadding,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}
