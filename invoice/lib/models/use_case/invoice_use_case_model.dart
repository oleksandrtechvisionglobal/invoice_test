import 'package:intl/intl.dart';
import 'package:invoice/common/utils/id_generator.dart';
import 'package:invoice/models/repo/invoice_repo_model.dart';
import 'package:ui_components/widgets/app_invoice_status_label.dart';
import 'package:uuid/uuid.dart';

class InvoiceUseCaseModel {
  final String id;
  final InvoiceBillFromUseCaseModel billFrom;
  final InvoiceBillToUseCaseModel billTo;
  final DateTime invoiceDate;
  final String terms;
  final String projectDescription;
  final List<InvoiceItemUseCaseModel> items;
  final InvoiceStatus status;

  InvoiceUseCaseModel({
    required this.id,
    required this.billFrom,
    required this.billTo,
    required this.invoiceDate,
    required this.terms,
    required this.projectDescription,
    required this.items,
    required this.status,
  });

  factory InvoiceUseCaseModel.fromRepoModel(InvoiceRepoModel repoModel) {
    return InvoiceUseCaseModel(
      id: repoModel.id,
      billFrom: InvoiceBillFromUseCaseModel.fromRepoModel(repoModel.billFrom),
      billTo: InvoiceBillToUseCaseModel.fromRepoModel(repoModel.billTo),
      invoiceDate: repoModel.invoiceDate,
      terms: repoModel.terms,
      projectDescription: repoModel.projectDescription,
      items: repoModel.items
          .map((e) => InvoiceItemUseCaseModel.fromRepoModel(e))
          .toList(),
      status: InvoiceStatus.fromServerValue(repoModel.status),
    );
  }

  InvoiceUseCaseModel copyWith({
    String? id,
    InvoiceBillFromUseCaseModel? billFrom,
    InvoiceBillToUseCaseModel? billTo,
    DateTime? invoiceDate,
    String? terms,
    String? projectDescription,
    List<InvoiceItemUseCaseModel>? items,
    InvoiceStatus? status,
  }) {
    return InvoiceUseCaseModel(
      id: id ?? this.id,
      billFrom: billFrom ?? this.billFrom,
      billTo: billTo ?? this.billTo,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      terms: terms ?? this.terms,
      projectDescription: projectDescription ?? this.projectDescription,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  factory InvoiceUseCaseModel.empty() {
    return InvoiceUseCaseModel(
      id: IdGenerator.getRandomString(5).toUpperCase(),
      billFrom: InvoiceBillFromUseCaseModel(
        streetAddress: '',
        city: '',
        postalCode: '',
        country: '',
      ),
      billTo: InvoiceBillToUseCaseModel(
        clientName: '',
        clientEmail: '',
        streetAddress: '',
        city: '',
        postalCode: '',
        country: '',
      ),
      invoiceDate: DateTime.now(),
      terms: '30',
      projectDescription: '',
      items: [InvoiceItemUseCaseModel.empty()],
      status: InvoiceStatus.draft,
    );
  }

  static List<String> termsListServer = ['15', '30', '45', '60', '90'];
  static List<String> termsListUI = [
    'Net 15',
    'Net 30',
    'Net 45',
    'Net 60',
    'Net 90'
  ];

  String get termsLabel {
    final index = termsListServer.indexOf(terms);
    return termsListUI[index];
  }

  static String serverValueFromLabel(String label) {
    final index = termsListUI.indexOf(label);
    return termsListServer[index];
  }

  String get formattedAddressFrom {
    return '${billFrom.streetAddress}\n${billFrom.city}\n${billFrom.postalCode}\n${billFrom.country}';
  }

  String get totalAmount {
    return items
        .fold<double>(
          0,
          (previousValue, element) =>
              previousValue + element.price * element.quantity,
        )
        .toStringAsFixed(2);
  }

  String get totalAmountFormatted {
    return '£ $totalAmount';
  }

  String get invoiceDateFormatted {
    final DateFormat dateFormat = DateFormat("d MMM yyyy");
    return dateFormat.format(invoiceDate);
  }

  String get paymentDueFormatted {
    final DateFormat dateFormat = DateFormat("d MMM yyyy");
    final paymentDue =
        invoiceDate.add(Duration(days: int.tryParse(terms) ?? 0));
    return dateFormat.format(paymentDue);
  }

  AppInvoiceStatus get uiEnum {
    return AppInvoiceStatus.values.firstWhere(
      (element) => element.toString().split('.').last == status.serverValue,
    );
  }
}

enum InvoiceStatus {
  draft,
  pending,
  paid;

  String get label {
    switch (this) {
      case InvoiceStatus.draft:
        return 'Draft';
      case InvoiceStatus.pending:
        return 'Pending';
      case InvoiceStatus.paid:
        return 'Paid';
    }
  }

  String get serverValue {
    switch (this) {
      case InvoiceStatus.draft:
        return 'draft';
      case InvoiceStatus.pending:
        return 'pending';
      case InvoiceStatus.paid:
        return 'paid';
    }
  }

  static InvoiceStatus fromServerValue(String value) {
    switch (value) {
      case 'draft':
        return InvoiceStatus.draft;
      case 'pending':
        return InvoiceStatus.pending;
      case 'paid':
        return InvoiceStatus.paid;
      default:
        throw Exception('Unknown value: $value');
    }
  }

  static InvoiceStatus fromLabel(String label) {
    switch (label) {
      case 'Draft':
        return InvoiceStatus.draft;
      case 'Pending':
        return InvoiceStatus.pending;
      case 'Paid':
        return InvoiceStatus.paid;
      default:
        throw Exception('Unknown label: $label');
    }
  }
}

class InvoiceBillFromUseCaseModel {
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillFromUseCaseModel({
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory InvoiceBillFromUseCaseModel.fromRepoModel(
      InvoiceBillFromRepoModel repoModel) {
    return InvoiceBillFromUseCaseModel(
      streetAddress: repoModel.streetAddress,
      city: repoModel.city,
      postalCode: repoModel.postalCode,
      country: repoModel.country,
    );
  }

  InvoiceBillFromUseCaseModel copyWith({
    String? streetAddress,
    String? city,
    String? postalCode,
    String? country,
  }) {
    return InvoiceBillFromUseCaseModel(
      streetAddress: streetAddress ?? this.streetAddress,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }
}

class InvoiceBillToUseCaseModel {
  final String clientName;
  final String clientEmail;
  final String streetAddress;
  final String city;
  final String postalCode;
  final String country;

  InvoiceBillToUseCaseModel({
    required this.clientName,
    required this.clientEmail,
    required this.streetAddress,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  String get formattedAddress {
    return '$streetAddress\n$city\n$postalCode\n$country';
  }

  factory InvoiceBillToUseCaseModel.fromRepoModel(
      InvoiceBillToRepoModel repoModel) {
    return InvoiceBillToUseCaseModel(
      clientName: repoModel.clientName,
      clientEmail: repoModel.clientEmail,
      streetAddress: repoModel.streetAddress,
      city: repoModel.city,
      postalCode: repoModel.postalCode,
      country: repoModel.country,
    );
  }

  InvoiceBillToUseCaseModel copyWith({
    String? clientName,
    String? clientEmail,
    String? streetAddress,
    String? city,
    String? postalCode,
    String? country,
  }) {
    return InvoiceBillToUseCaseModel(
      clientName: clientName ?? this.clientName,
      clientEmail: clientEmail ?? this.clientEmail,
      streetAddress: streetAddress ?? this.streetAddress,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
    );
  }
}

class InvoiceItemUseCaseModel {
  final String name;
  final int quantity;
  final double price;

  InvoiceItemUseCaseModel({
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get total => price * quantity;

  String get totalFormatted => '£ ${total.toStringAsFixed(2)}';

  String get quantityAndPriceFormatted =>
      '$quantity x £ ${price.toStringAsFixed(2)}';

  factory InvoiceItemUseCaseModel.fromRepoModel(
      InvoiceItemRepoModel repoModel) {
    return InvoiceItemUseCaseModel(
      name: repoModel.name,
      quantity: repoModel.quantity,
      price: repoModel.price,
    );
  }

  InvoiceItemUseCaseModel copyWith({
    String? name,
    int? quantity,
    double? price,
  }) {
    return InvoiceItemUseCaseModel(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  factory InvoiceItemUseCaseModel.empty() {
    return InvoiceItemUseCaseModel(
      name: '',
      quantity: 0,
      price: 0,
    );
  }
}
