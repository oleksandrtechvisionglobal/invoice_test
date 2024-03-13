import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/common/widgets/invoice_back_button.dart';
import 'package:invoice/data/vm/single_invoice_vm.dart';
import 'package:invoice/models/form/invoice.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:invoice/routers/screen_names.dart';
import 'package:ui_components/tokens/app_typography.dart';
import 'package:ui_components/ui_components.dart';

import 'widget/form_view.dart';

class EditInvoicePage extends StatefulHookConsumerWidget {
  const EditInvoicePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _EditInvoicePageState();
  }
}

class _EditInvoicePageState extends ConsumerState<EditInvoicePage> {
  final EdgeInsets _paddings = const EdgeInsets.symmetric(horizontal: 24);
  final ScrollController _scrollController = ScrollController();
  late String currentId;
  bool isNew = false;
  late InvoiceForm form;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentId = GoRouterState.of(context).uri.pathSegments[1];
      isNew = currentId == 'new';
      if (!isNew) {
        ref.read(singleInvoiceVMProvider.notifier).loadInvoice(currentId);
      } else {
        ref.read(singleInvoiceVMProvider.notifier).loadEmptyInvoice();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final item = ref.watch(singleInvoiceVMProvider);

    if (item == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Container(
      color: context.colors.background,
      child: Column(
        children: [
          Expanded(
            child: AppScroll(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: _paddings,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InvoiceBackButton(onPressed: () {
                        if (isNew) {
                          context.goNamed(ScreenNames.home);
                        } else {
                          context.pushNamed(ScreenNames.viewInvoice,
                              pathParameters: {'id': currentId});
                        }
                      }),
                      Text(isNew ? 'New Invoice' : 'Edit Invoice',
                          style: AppTypography.headingM(
                              context.colors.textPrimary)),
                      const SizedBox(height: 22),
                      FormView(
                          model: item,
                          onFormChanged: (form) {
                            this.form = form;
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.colors.inputBackground,
              boxShadow: [
                BoxShadow(
                  color: context.colors.shadowColor,
                  offset: const Offset(0, -8),
                  blurRadius: 8,
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Container(
                height: 91,
                color: context.colors.inputBackground,
                child: Padding(
                  padding: _paddings,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildButtonsRow(item),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButtonsRow(InvoiceUseCaseModel item) {
    final discardButton = AppButton(
      text: isNew ? 'Discard' : 'Cancel',
      style: AppButtonStyle.secondary,
      onPressed: () {
        if (isNew) {
          context.goNamed(ScreenNames.home);
        } else {
          context.pushNamed(ScreenNames.viewInvoice,
              pathParameters: {'id': currentId});
        }
      },
    );
    final saveAsDraftButton = Opacity(
      opacity: isNew ? 1 : 0,
      child: AppButton(
        text: 'Save as Draft',
        style: AppButtonStyle.darkButton,
        onPressed: isNew
            ? () {
                form.submit(onValid: (model) {
                  final item = model.toUseCaseModel();
                  ref.read(singleInvoiceVMProvider.notifier).saveAsDraft(item);
                  context.goNamed(ScreenNames.home);
                });
              }
            : null,
      ),
    );

    final saveButton = AppButton(
      text: isNew ? 'Save & Send' : 'Save Changes',
      style: AppButtonStyle.primary,
      onPressed: () {
        form.submit(onValid: (model) {
          final item = model.toUseCaseModel();
          if (isNew) {
            ref.read(singleInvoiceVMProvider.notifier).saveAsPending(item);
            context.goNamed(ScreenNames.home);
          } else {
            ref.read(singleInvoiceVMProvider.notifier).saveInvoice(item);
            context.pushNamed(ScreenNames.viewInvoice,
                pathParameters: {'id': currentId});
          }
        });
      },
    );

    if (isNew) {
      return [discardButton, saveAsDraftButton, saveButton];
    } else {
      return [saveAsDraftButton, discardButton, saveButton];
    }
  }
}
