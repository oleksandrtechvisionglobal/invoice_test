import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../use_case/invoice_use_case_model.dart';

part 'invoice.gform.dart';

@Rf()
class Invoice {
  String id;
  InvoiceBillFrom? billFrom;
  InvoiceBillTo? billTo;
  DateTime? invoiceDate;
  String terms;
  String projectDescription;
  List<InvoiceItem> items;
  String status;

  Invoice({
    @RfControl() this.id = '',
    this.billFrom,
    this.billTo,
    @RfControl() this.invoiceDate,
    @RfControl() this.terms = '',
    @RfControl() this.projectDescription = '',
    @RfArray() this.items = const [],
    @RfControl() this.status = '',
  });

  factory Invoice.fromUseCaseModel(InvoiceUseCaseModel useCaseModel) {
    return Invoice(
      id: useCaseModel.id,
      billFrom: InvoiceBillFrom.fromUseCaseModel(useCaseModel.billFrom),
      billTo: InvoiceBillTo.fromUseCaseModel(useCaseModel.billTo),
      invoiceDate: useCaseModel.invoiceDate,
      terms: useCaseModel.termsLabel,
      projectDescription: useCaseModel.projectDescription,
      items: useCaseModel.items
          .map((e) => InvoiceItem.fromUseCaseModel(e))
          .toList(),
      status: useCaseModel.status.label,
    );
  }

  InvoiceUseCaseModel toUseCaseModel() {
    final billFrom = this.billFrom ?? InvoiceBillFrom();
    final billTo = this.billTo ?? InvoiceBillTo();
    return InvoiceUseCaseModel(
      id: id,
      billFrom: billFrom.toUseCaseModel(),
      billTo: billTo.toUseCaseModel(),
      invoiceDate: invoiceDate ?? DateTime.now(),
      terms: InvoiceUseCaseModel.serverValueFromLabel(terms),
      projectDescription: projectDescription,
      items: items.map((e) => e.toUseCaseModel()).toList(),
      status: InvoiceStatus.fromLabel(status),
    );
  }
}

@Rf()
@RfGroup()
class InvoiceBillFrom {
  @RfControl()
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillFrom({
    @RfControl() this.streetAddress = '',
    @RfControl() this.city = '',
    @RfControl() this.postalCode = '',
    @RfControl() this.country = '',
  });

  factory InvoiceBillFrom.fromUseCaseModel(
      InvoiceBillFromUseCaseModel useCaseModel) {
    return InvoiceBillFrom(
      streetAddress: useCaseModel.streetAddress,
      city: useCaseModel.city,
      postalCode: useCaseModel.postalCode,
      country: useCaseModel.country,
    );
  }

  InvoiceBillFromUseCaseModel toUseCaseModel() {
    return InvoiceBillFromUseCaseModel(
      streetAddress: streetAddress,
      city: city,
      postalCode: postalCode,
      country: country,
    );
  }
}

@Rf()
@RfGroup()
class InvoiceBillTo {
  final String clientName;
  final String clientEmail;
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillTo({
    @RfControl() this.clientName = '',
    @RfControl() this.clientEmail = '',
    @RfControl() this.streetAddress = '',
    @RfControl() this.city = '',
    @RfControl() this.postalCode = '',
    @RfControl() this.country = '',
  });

  factory InvoiceBillTo.fromUseCaseModel(
      InvoiceBillToUseCaseModel useCaseModel) {
    return InvoiceBillTo(
      clientName: useCaseModel.clientName,
      clientEmail: useCaseModel.clientEmail,
      streetAddress: useCaseModel.streetAddress,
      city: useCaseModel.city,
      postalCode: useCaseModel.postalCode,
      country: useCaseModel.country,
    );
  }

  InvoiceBillToUseCaseModel toUseCaseModel() {
    return InvoiceBillToUseCaseModel(
      clientName: clientName,
      clientEmail: clientEmail,
      streetAddress: streetAddress,
      city: city,
      postalCode: postalCode,
      country: country,
    );
  }
}

@Rf()
@RfGroup()
class InvoiceItem {
  final String? itemName;
  final int? quantity;
  final double? price;

  InvoiceItem({
    @RfControl() this.itemName = '',
    @RfControl() this.quantity = 0,
    @RfControl() this.price = 0,
  });

  factory InvoiceItem.fromUseCaseModel(InvoiceItemUseCaseModel useCaseModel) {
    return InvoiceItem(
      itemName: useCaseModel.name,
      quantity: useCaseModel.quantity.toInt(),
      price: useCaseModel.price,
    );
  }

  InvoiceItemUseCaseModel toUseCaseModel() {
    return InvoiceItemUseCaseModel(
      name: itemName ?? '',
      quantity: quantity ?? 0,
      price: price ?? 0,
    );
  }
}
