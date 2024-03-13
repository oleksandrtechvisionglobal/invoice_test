import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

class AppInvoiceListItem extends StatelessWidget {
  final String id;
  final String clientName;
  final String date;
  final String total;
  final AppInvoiceStatus status;

  const AppInvoiceListItem({
    Key? key,
    required this.id,
    required this.clientName,
    required this.date,
    required this.total,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 134,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
          color: context.colors.inputBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#',
                    style: AppTypography.headingSVariant(
                      context.colors.textButtonSecondaryColor,
                    ),
                  ),
                  Text(
                    id,
                    style: AppTypography.headingSVariant(
                      context.colors.textPrimary,
                    ),
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Text(
                      clientName,
                      style: AppTypography.bodyVariant(
                          context.colors.textClientColor),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Due ',
                              style: AppTypography.bodyVariant(
                                context.colors.textPrefixColor,
                              ),
                            ),
                            Text(
                              date,
                              style: AppTypography.bodyVariant(
                                context.colors.textDateColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        Text(
                          total,
                          style: AppTypography.headingS(
                            context.colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppInvoiceStatusLabel(status: status),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
