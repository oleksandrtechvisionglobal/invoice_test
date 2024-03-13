import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class AppScroll extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;

  const AppScroll({
    Key? key,
    required this.child,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            context.colors.scrollBarColor,
          ),
          trackColor: MaterialStateProperty.all(
            context.colors.scrollBarColor,
          ),
        ),
      ),
      child: Scrollbar(
        child: child,
        controller: controller,
      ),
    );
  }
}
