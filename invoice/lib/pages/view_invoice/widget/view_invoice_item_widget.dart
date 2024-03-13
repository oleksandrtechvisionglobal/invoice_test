import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:ui_components/theme/app_theme_colors.dart';
import 'package:ui_components/tokens/app_typography.dart';

class ViewInvoiceItemWidget extends StatelessWidget {
  final InvoiceItemUseCaseModel item;

  const ViewInvoiceItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTypography.headingSVariant(
                    context.colors.textPrimary,
                  ),
                ),
                const Spacer(),
                Text(
                  item.quantityAndPriceFormatted,
                  style: AppTypography.headingSVariant(
                    context.colors.textQuantityColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.totalFormatted,
            style: AppTypography.headingSVariant(
              context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
