import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice/common/widgets/invoice_shell.dart';
import 'package:invoice/pages/edit_invoice/edit_invoice_page.dart';
import 'package:invoice/pages/home/home_page.dart';
import 'package:invoice/pages/view_invoice/view_invoice_page.dart';

import 'screen_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

class AppRoutes {
  final r = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/${ScreenNames.home}',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return InvoiceShell(key: state.pageKey, child: child);
        },
        routes: [
          GoRoute(
            path: '/${ScreenNames.home}',
            name: ScreenNames.home,
            pageBuilder: (context, state) {
              return _buildPageWithDefaultTransition(
                  context: context, state: state, child: const HomePage());
            },
            routes: [
              GoRoute(
                path: ":id/view",
                name: ScreenNames.viewInvoice,
                pageBuilder: (context, state) {
                  return _buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const ViewInvoicePage());
                },
              ),
              GoRoute(
                path: ":id/edit",
                name: ScreenNames.editInvoice,
                pageBuilder: (context, state) {
                  return _buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const EditInvoicePage());
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<T> _buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: ValueKey(state.path),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
