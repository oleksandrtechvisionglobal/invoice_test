import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AppDivider extends StatelessWidget {
  final bool isVertical;

  const AppDivider({Key? key, this.isVertical = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: isVertical ? 1 : 0,
      child: Divider(
        height: 1,
        color: context.colors.dividerColor,
      ),
    );
  }
}
