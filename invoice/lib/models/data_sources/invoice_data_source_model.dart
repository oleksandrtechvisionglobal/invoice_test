import 'package:invoice/models/repo/invoice_repo_model.dart';

class InvoiceDataSourceModel {
  final String id;
  final InvoiceBillFromDataSourceModel billFrom;
  final InvoiceBillToDataSourceModel billTo;
  final DateTime invoiceDate;
  final String terms;
  final String projectDescription;
  final List<InvoiceItemDataSourceModel> items;
  final String status;

  InvoiceDataSourceModel({
    required this.id,
    required this.billFrom,
    required this.billTo,
    required this.invoiceDate,
    required this.terms,
    required this.projectDescription,
    required this.items,
    required this.status,
  });

  factory InvoiceDataSourceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceDataSourceModel(
      id: json['id'],
      billFrom: InvoiceBillFromDataSourceModel.fromJson(json['billFrom']),
      billTo: InvoiceBillToDataSourceModel.fromJson(json['billTo']),
      invoiceDate: DateTime.parse(json['invoiceDate']),
      terms: json['terms'],
      projectDescription: json['projectDescription'],
      items: (json['items'] as List)
          .map((e) => InvoiceItemDataSourceModel.fromJson(e))
          .toList(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'billFrom': billFrom.toJson(),
      'billTo': billTo.toJson(),
      'invoiceDate': invoiceDate.toIso8601String(),
      'terms': terms,
      'projectDescription': projectDescription,
      'items': items.map((e) => e.toJson()).toList(),
      'status': status,
    };
  }

  factory InvoiceDataSourceModel.fromRepoModel(InvoiceRepoModel repoModel) {
    return InvoiceDataSourceModel(
      id: repoModel.id,
      billFrom:
          InvoiceBillFromDataSourceModel.fromRepoModel(repoModel.billFrom),
      billTo: InvoiceBillToDataSourceModel.fromRepoModel(repoModel.billTo),
      invoiceDate: repoModel.invoiceDate,
      terms: repoModel.terms,
      projectDescription: repoModel.projectDescription,
      items: repoModel.items
          .map((e) => InvoiceItemDataSourceModel.fromRepoModel(e))
          .toList(),
      status: repoModel.status,
    );
  }
}

class InvoiceBillFromDataSourceModel {
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillFromDataSourceModel({
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory InvoiceBillFromDataSourceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceBillFromDataSourceModel(
      streetAddress: json['streetAddress'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  factory InvoiceBillFromDataSourceModel.fromRepoModel(
      InvoiceBillFromRepoModel repoModel) {
    return InvoiceBillFromDataSourceModel(
      streetAddress: repoModel.streetAddress,
      city: repoModel.city,
      postalCode: repoModel.postalCode,
      country: repoModel.country,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'streetAddress': streetAddress,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }
}

class InvoiceBillToDataSourceModel {
  final String clientName;
  final String clientEmail;
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillToDataSourceModel({
    required this.clientName,
    required this.clientEmail,
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory InvoiceBillToDataSourceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceBillToDataSourceModel(
      clientName: json['clientName'],
      clientEmail: json['clientEmail'],
      streetAddress: json['streetAddress'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  factory InvoiceBillToDataSourceModel.fromRepoModel(
      InvoiceBillToRepoModel repoModel) {
    return InvoiceBillToDataSourceModel(
      clientName: repoModel.clientName,
      clientEmail: repoModel.clientEmail,
      streetAddress: repoModel.streetAddress,
      city: repoModel.city,
      postalCode: repoModel.postalCode,
      country: repoModel.country,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'clientEmail': clientEmail,
      'streetAddress': streetAddress,
      'city': city,
      'postalCode': postalCode,
      'country': country,
    };
  }
}

class InvoiceItemDataSourceModel {
  final String name;
  final int quantity;
  final double price;

  InvoiceItemDataSourceModel({
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory InvoiceItemDataSourceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemDataSourceModel(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  factory InvoiceItemDataSourceModel.fromRepoModel(
      InvoiceItemRepoModel repoModel) {
    return InvoiceItemDataSourceModel(
      name: repoModel.name,
      quantity: repoModel.quantity,
      price: repoModel.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
