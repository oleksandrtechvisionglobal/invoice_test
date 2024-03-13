import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/data/vm/invoice_vm.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:invoice/routers/screen_names.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

import 'widget/empty_list_widget.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(invoiceVMProvider.notifier).loadInvoices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final invoiceList = ref.watch(invoiceVMProvider);
    return Container(
      color: context.colors.background,
      child: Column(
        children: [
          const SizedBox(height: 32),
          _buildTopBar(invoiceList),
          const SizedBox(height: 32),
          Expanded(child: _buildBody(invoiceList)),
        ],
      ),
    );
  }

  Widget _buildTopBar(List<InvoiceUseCaseModel> invoiceList) {
    return Row(
      children: [
        const SizedBox(width: 24),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoices',
              style: AppTypography.headingM(context.colors.textPrimary),
            ),
            const SizedBox(height: 3),
            Text(
              invoiceList.isEmpty
                  ? 'No invoices'
                  : '${invoiceList.length} invoices',
              style: AppTypography.body(context.colors.textPrefixColor),
            ),
          ],
        ),
        const Spacer(),
        AppButton(
          text: 'New',
          style: AppButtonStyle.iconButton,
          onPressed: () {
            context.goNamed(
              ScreenNames.editInvoice,
              pathParameters: {
                'id': 'new',
              },
            );
          },
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildBody(List<InvoiceUseCaseModel> invoiceList) {
    final scrollController = ScrollController();
    return invoiceList.isEmpty
        ? const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EmptyListWidget(),
            ],
          )
        : AppScroll(
            controller: scrollController,
            child: ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                final invoice = invoiceList[index];
                return InkWell(
                  onTap: () {
                    context.goNamed(
                      ScreenNames.viewInvoice,
                      pathParameters: {
                        'id': invoice.id,
                      },
                    );
                  },
                  child: AppInvoiceListItem(
                    id: invoice.id,
                    clientName: invoice.billTo.clientName,
                    date: invoice.invoiceDateFormatted,
                    total: '£ ${invoice.totalAmount}',
                    status: invoice.uiEnum,
                  ),
                );
              },
              itemCount: invoiceList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
          );
  }
}
