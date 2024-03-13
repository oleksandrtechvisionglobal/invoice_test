import 'package:invoice/models/data_sources/invoice_data_source_model.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';

class InvoiceRepoModel {
  final String id;
  final InvoiceBillFromRepoModel billFrom;
  final InvoiceBillToRepoModel billTo;
  final DateTime invoiceDate;
  final String terms;
  final String projectDescription;
  final List<InvoiceItemRepoModel> items;
  final String status;

  InvoiceRepoModel({
    required this.id,
    required this.billFrom,
    required this.billTo,
    required this.invoiceDate,
    required this.terms,
    required this.projectDescription,
    required this.items,
    required this.status,
  });

  factory InvoiceRepoModel.fromDataSource(InvoiceDataSourceModel dataSource) {
    return InvoiceRepoModel(
      id: dataSource.id,
      billFrom: InvoiceBillFromRepoModel.fromDataSource(dataSource.billFrom),
      billTo: InvoiceBillToRepoModel.fromDataSource(dataSource.billTo),
      invoiceDate: dataSource.invoiceDate,
      terms: dataSource.terms,
      projectDescription: dataSource.projectDescription,
      items: dataSource.items
          .map((e) => InvoiceItemRepoModel.fromDataSource(e))
          .toList(),
      status: dataSource.status,
    );
  }

  factory InvoiceRepoModel.fromUseCaseModel(InvoiceUseCaseModel useCaseModel) {
    return InvoiceRepoModel(
      id: useCaseModel.id,
      billFrom:
          InvoiceBillFromRepoModel.fromUseCaseModel(useCaseModel.billFrom),
      billTo: InvoiceBillToRepoModel.fromUseCaseModel(useCaseModel.billTo),
      invoiceDate: useCaseModel.invoiceDate,
      terms: useCaseModel.terms,
      projectDescription: useCaseModel.projectDescription,
      items: useCaseModel.items
          .map((e) => InvoiceItemRepoModel.fromUseCaseModel(e))
          .toList(),
      status: useCaseModel.status.serverValue,
    );
  }
}

class InvoiceBillFromRepoModel {
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillFromRepoModel({
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory InvoiceBillFromRepoModel.fromDataSource(
      InvoiceBillFromDataSourceModel dataSource) {
    return InvoiceBillFromRepoModel(
      streetAddress: dataSource.streetAddress,
      city: dataSource.city,
      postalCode: dataSource.postalCode,
      country: dataSource.country,
    );
  }

  factory InvoiceBillFromRepoModel.fromUseCaseModel(
      InvoiceBillFromUseCaseModel useCaseModel) {
    return InvoiceBillFromRepoModel(
      streetAddress: useCaseModel.streetAddress,
      city: useCaseModel.city,
      postalCode: useCaseModel.postalCode,
      country: useCaseModel.country,
    );
  }
}

class InvoiceBillToRepoModel {
  final String clientName;
  final String clientEmail;
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillToRepoModel({
    required this.clientName,
    required this.clientEmail,
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory InvoiceBillToRepoModel.fromDataSource(
      InvoiceBillToDataSourceModel dataSource) {
    return InvoiceBillToRepoModel(
      clientName: dataSource.clientName,
      clientEmail: dataSource.clientEmail,
      streetAddress: dataSource.streetAddress,
      city: dataSource.city,
      postalCode: dataSource.postalCode,
      country: dataSource.country,
    );
  }

  factory InvoiceBillToRepoModel.fromUseCaseModel(
      InvoiceBillToUseCaseModel useCaseModel) {
    return InvoiceBillToRepoModel(
      clientName: useCaseModel.clientName,
      clientEmail: useCaseModel.clientEmail,
      streetAddress: useCaseModel.streetAddress,
      city: useCaseModel.city,
      postalCode: useCaseModel.postalCode,
      country: useCaseModel.country,
    );
  }
}

class InvoiceItemRepoModel {
  final String name;
  final int quantity;
  final double price;

  InvoiceItemRepoModel({
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory InvoiceItemRepoModel.fromDataSource(
      InvoiceItemDataSourceModel dataSource) {
    return InvoiceItemRepoModel(
      name: dataSource.name,
      quantity: dataSource.quantity,
      price: dataSource.price,
    );
  }

  factory InvoiceItemRepoModel.fromUseCaseModel(
      InvoiceItemUseCaseModel useCaseModel) {
    return InvoiceItemRepoModel(
      name: useCaseModel.name,
      quantity: useCaseModel.quantity,
      price: useCaseModel.price,
    );
  }
}
