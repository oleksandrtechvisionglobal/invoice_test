import 'package:flutter/material.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/widgets/app_invoice_status_label.dart';

import 'view_invoice_item_widget.dart';

class ViewInvoiceBody extends StatelessWidget {
  final InvoiceUseCaseModel item;
  const ViewInvoiceBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 91,
          decoration: BoxDecoration(
            color: context.colors.inputBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Status',
                  style: AppTypography.body(context.colors.textPrefixColor),
                ),
                const Spacer(),
                AppInvoiceStatusLabel(status: item.uiEnum),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.inputBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '#',
                      style: AppTypography.headingSVariant(
                        context.colors.textButtonSecondaryColor,
                      ),
                    ),
                    Text(
                      item.id,
                      style: AppTypography.headingSVariant(
                        context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.projectDescription,
                  style: AppTypography.bodyVariant(
                    context.colors.textDateColor,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  item.formattedAddressFrom,
                  style: AppTypography.bodyVariant(
                    context.colors.textDateColor,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 130,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invoice Date',
                              style: AppTypography.bodyVariant(
                                context.colors.textDateColor,
                              ),
                            ),
                            const SizedBox(height: 13),
                            Text(
                              item.invoiceDateFormatted,
                              style: AppTypography.headingSVariant(
                                context.colors.textPrimary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Payment Due',
                              style: AppTypography.bodyVariant(
                                context.colors.textDateColor,
                              ),
                            ),
                            const SizedBox(height: 13),
                            Text(
                              item.paymentDueFormatted,
                              style: AppTypography.headingSVariant(
                                context.colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bill To',
                              style: AppTypography.bodyVariant(
                                context.colors.textDateColor,
                              ),
                            ),
                            const SizedBox(height: 13),
                            Text(
                              item.billTo.clientName,
                              style: AppTypography.headingSVariant(
                                context.colors.textPrimary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              item.billTo.formattedAddress,
                              style: AppTypography.bodyVariant(
                                context.colors.textDateColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Send to',
                  style: AppTypography.bodyVariant(
                    context.colors.textDateColor,
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  item.billTo.clientEmail,
                  style: AppTypography.headingSVariant(
                    context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 38),
                Container(
                  decoration: BoxDecoration(
                    color: context.colors.buttonSecondaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: item.items.length,
                      itemBuilder: (context, index) {
                        return ViewInvoiceItemWidget(
                          item: item.items[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 24);
                      },
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: context.colors.amountBgColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              'Grand Total',
                              style: AppTypography.body(
                                context.colors.textButtonWhite,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              item.totalAmountFormatted,
                              style: AppTypography.headingM(
                                context.colors.textButtonWhite,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
