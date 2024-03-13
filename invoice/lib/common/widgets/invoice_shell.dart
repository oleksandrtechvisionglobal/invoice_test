import 'package:flutter/material.dart';
import 'package:ui_components/theme/app_theme_colors.dart';

import 'invoice_app_bar.dart';

class InvoiceShell extends StatelessWidget {
  final Widget child;

  const InvoiceShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.appBarBackground,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: const InvoiceAppBar(),
          body: child,
        ),
      ),
    );
  }
}
