import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/common/widgets/invoice_back_button.dart';
import 'package:invoice/data/vm/invoice_vm.dart';
import 'package:invoice/data/vm/single_invoice_vm.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:invoice/routers/screen_names.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

import 'widget/view_invoice_body.dart';
import 'widget/view_invoice_item_widget.dart';

class ViewInvoicePage extends StatefulHookConsumerWidget {
  const ViewInvoicePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ViewInvoicePageState();
  }
}

class _ViewInvoicePageState extends ConsumerState<ViewInvoicePage> {
  final EdgeInsets _paddings = const EdgeInsets.symmetric(horizontal: 24);
  late String currentId;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentId = GoRouterState.of(context).uri.pathSegments[1];
      ref.read(singleInvoiceVMProvider.notifier).loadInvoice(currentId);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(singleInvoiceVMProvider);
    if (item == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final ScrollController scrollController = ScrollController();
    return Container(
      color: context.colors.background,
      child: Column(
        children: [
          Expanded(
            child: AppScroll(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: _paddings,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InvoiceBackButton(onPressed: () {
                        context.goNamed(ScreenNames.home);
                      }),
                      ViewInvoiceBody(item: item),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: context.colors.inputBackground,
            child: SafeArea(
              top: false,
              child: Container(
                height: 91,
                color: context.colors.inputBackground,
                child: Padding(
                  padding: _paddings,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          text: 'Edit',
                          style: AppButtonStyle.secondary,
                          onPressed: () {
                            context.goNamed(
                              ScreenNames.editInvoice,
                              pathParameters: {
                                'id': item.id,
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppButton(
                          text: 'Delete',
                          style: AppButtonStyle.danger,
                          onPressed: () {
                            _showDeleteDialog(item);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppButton(
                        text: 'Mark as Paid',
                        style: AppButtonStyle.primary,
                        onPressed: () {
                          ref
                              .read(singleInvoiceVMProvider.notifier)
                              .markAsPaid(item);
                          context.goNamed(ScreenNames.home);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDeleteDialog(InvoiceUseCaseModel item) async {
    final bool? res = await showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'Confirm Deletion',
        content:
            'Are you sure you want to delete invoice #${item.id}? This action cannot be undone.',
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel',
        cancelButtonStyle: AppButtonStyle.secondary,
        confirmButtonStyle: AppButtonStyle.danger,
      ),
    );
    if (res != null && res) {
      ref.read(singleInvoiceVMProvider.notifier).deleteInvoice(item.id);
      _backToHome();
    }
  }

  _backToHome() {
    context.goNamed(ScreenNames.home);
  }
}
