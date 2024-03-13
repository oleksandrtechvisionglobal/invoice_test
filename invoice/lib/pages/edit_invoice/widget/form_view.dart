import 'package:flutter/material.dart';
import 'package:invoice/models/form/invoice.dart';
import 'package:invoice/pages/edit_invoice/reactive_forms/app_reactive_pickers.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:ui_components/widgets/app_button.dart';
import 'package:ui_components/widgets/app_form_group_label.dart';
import 'package:ui_components/widgets/app_text_field.dart';

import '../../../gen/assets.gen.dart';
import '../../../models/use_case/invoice_use_case_model.dart';

class FormView extends StatefulWidget {
  final InvoiceUseCaseModel? model;
  final ValueSetter<InvoiceForm> onFormChanged;

  const FormView({super.key, this.model, required this.onFormChanged});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  Invoice form = Invoice();

  @override
  void initState() {
    if (widget.model != null) {
      form = Invoice.fromUseCaseModel(widget.model!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            InvoiceFormBuilder(
                model: form,
                builder: (context, formModel, _) {
                  return Column(
                    children: [
                      ReactiveInvoiceFormConsumer(builder:
                          (BuildContext context, InvoiceForm formModel,
                              Widget? child) {
                        widget.onFormChanged(formModel);
                        return const SizedBox();
                      }),
                      InvoiceBillFromFormBuilder(
                        model: form.billFrom,
                        builder: (context, billFromModel, _) {
                          return Column(
                            children: [
                              _buildSectionTitle('Bill From'),
                              AppReactiveTextField(
                                  formControl:
                                      billFromModel.streetAddressControl,
                                  hintText: 'Street Address'),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppReactiveTextField(
                                        formControl: billFromModel.cityControl,
                                        hintText: 'City'),
                                  ),
                                  const SizedBox(width: 23),
                                  Expanded(
                                    child: AppReactiveTextField(
                                        formControl:
                                            billFromModel.postalCodeControl,
                                        hintText: 'Postal Code'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 25),
                              AppReactiveTextField(
                                  formControl: billFromModel.countryControl,
                                  hintText: 'Country'),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 41),
                      InvoiceBillToFormBuilder(
                        model: form.billTo,
                        builder: (context, billToModel, _) {
                          return Column(
                            children: [
                              _buildSectionTitle('Bill To'),
                              AppReactiveTextField(
                                  formControl: billToModel.clientNameControl,
                                  hintText: "Client's Name"),
                              const SizedBox(height: 25),
                              AppReactiveTextField(
                                  formControl: billToModel.clientEmailControl,
                                  hintText: "Client's Email"),
                              const SizedBox(height: 25),
                              AppReactiveTextField(
                                  formControl: billToModel.streetAddressControl,
                                  hintText: 'Street Address'),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppReactiveTextField(
                                        formControl: billToModel.cityControl,
                                        hintText: 'City'),
                                  ),
                                  const SizedBox(width: 23),
                                  Expanded(
                                    child: AppReactiveTextField(
                                        formControl:
                                            billToModel.postalCodeControl,
                                        hintText: 'Postal Code'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 25),
                              AppReactiveTextField(
                                  formControl: billToModel.countryControl,
                                  hintText: 'Country')
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 41),
                      _buildDatePicker(formModel.invoiceDateControl),
                      const SizedBox(height: 25),
                      _buildDropDown(formModel.termsControl),
                      const SizedBox(height: 25),
                      AppReactiveTextField(
                          formControl: formModel.projectDescriptionControl,
                          hintText: 'Project Description'),
                      const SizedBox(height: 69),
                      _buildSectionTitle('Item List', items: true),
                      const SizedBox(height: 22),
                      _buildItems(formModel),
                      const SizedBox(
                        height: 66,
                      ),
                      _buildAddButton(onTap: () {
                        formModel.addItemsItem(InvoiceItem());
                      }),
                      const SizedBox(height: 48),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {bool? items}) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            AppFormGroupLabel(
              label: title,
              itemsLabel: items,
            ),
          ],
        ));
  }

  Widget _buildDatePicker(FormControl<DateTime>? form) {
    return AppReactiveDatePicker(
      hintText: 'Invoice Date',
      formControl: form,
    );
  }

  Widget _buildDropDown(FormControl<String>? form) {
    return AppReactiveStringPicker(
      hintText: 'Payment Terms',
      formControl: form,
      items: InvoiceUseCaseModel.termsListUI,
    );
  }

  Widget _buildAddButton({required VoidCallback onTap}) {
    return AppButton(
      text: '+ Add New Item',
      style: AppButtonStyle.stretchedButton,
      onPressed: onTap,
    );
  }

  Widget _buildItems(InvoiceForm formModel) {
    return ReactiveFormArray<Map<String, Object?>>(
      formArray: formModel.itemsControl,
      builder: (context, formArray, child) {
        return Column(
          children: formModel.itemsControl.value!
              .asMap()
              .map((i, deliveryPoint) {
                return MapEntry(
                    i,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppReactiveTextField<String>(
                            formControl: formArray.control('$i.itemName')
                                as FormControl<String>,
                            hintText: 'Item Name'),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: AppReactiveTextField<int>(
                                  isDouble: false,
                                  formControl: formArray.control('$i.quantity')
                                      as FormControl<int>,
                                  hintText: 'Qty.'),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: AppReactiveTextField<double>(
                                  isDouble: true,
                                  formControl: formArray.control('$i.price')
                                      as FormControl<double>,
                                  hintText: 'Price'),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: ReactiveInvoiceFormConsumer(
                                builder: (context, formModel, _) {
                                  formModel.itemsControl.controls[i].valid;
                                  final quantity =
                                      formModel.model.items[i].quantity ?? 0;
                                  final price =
                                      formModel.model.items[i].price ?? 0;
                                  return AppTextField(
                                    hintText: 'Total',
                                    enabled: false,
                                    controller: TextEditingController(
                                        text: (quantity * price).toString()),
                                    onChanged: (_) {},
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                formModel.removeItemsItemAtIndex(i);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 16),
                                child: Assets.icons.deleteIcon.svg(),
                              ),
                            )
                          ],
                        ),
                      ],
                    ));
              })
              .values
              .toList(),
        );
      },
    );
  }
}
