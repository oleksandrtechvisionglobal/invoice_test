import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:ui_components/ui_components.dart';

void main() {
  group('Invoice UseCaseModel tests', () {
    test('totalAmountFormatted is correct', () async {
      final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
        items: [
          InvoiceItemUseCaseModel(
            quantity: 1,
            name: 'Item 1',
            price: 100,
          ),
        ],
      );

      expect(invoiceUseCaseModel.totalAmountFormatted, equals('£ 100.00'));
    });

    test('totalAmountFormatted is correct', () async {
      final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
        items: [
          InvoiceItemUseCaseModel(
            quantity: 1,
            name: 'Item 1',
            price: 100,
          ),
          InvoiceItemUseCaseModel(
            quantity: 2,
            name: 'Item 2',
            price: 200,
          ),
        ],
      );

      expect(invoiceUseCaseModel.totalAmountFormatted, equals('£ 500.00'));
    });

    test('totalAmount is correct', () async {
      final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
        items: [
          InvoiceItemUseCaseModel(
            quantity: 1,
            name: 'Item 1',
            price: 100,
          ),
        ],
      );

      expect(invoiceUseCaseModel.totalAmount, equals('100.00'));
    });

    test('totalAmount is correct', () async {
      final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
        items: [
          InvoiceItemUseCaseModel(
            quantity: 1,
            name: 'Item 1',
            price: 100,
          ),
          InvoiceItemUseCaseModel(
            quantity: 2,
            name: 'Item 2',
            price: 200,
          ),
        ],
      );

      expect(invoiceUseCaseModel.totalAmount, equals('500.00'));
    });

    test('formattedAddressFrom is correct', () async {
      final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
        billFrom: InvoiceBillFromUseCaseModel(
          streetAddress: 'Street 1',
          city: 'City 1',
          postalCode: '12345',
          country: 'Country 1',
        ),
      );

      expect(
        invoiceUseCaseModel.formattedAddressFrom,
        equals('Street 1\nCity 1\n12345\nCountry 1'),
      );
    });
  });

  test('formattedAddressTo is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      billTo: InvoiceBillToUseCaseModel(
        clientName: 'Client 1',
        clientEmail: '',
        streetAddress: 'Street 1',
        city: 'City 1',
        postalCode: '12345',
        country: 'Country 1',
      ),
    );

    expect(
      invoiceUseCaseModel.billTo.formattedAddress,
      equals('Street 1\nCity 1\n12345\nCountry 1'),
    );
  });

  test('invoiceDateFormatted is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      invoiceDate: DateTime(2021, 1, 1),
    );

    expect(invoiceUseCaseModel.invoiceDateFormatted, equals('1 Jan 2021'));
  });

  test('paymentDueFormatted is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      invoiceDate: DateTime(2021, 1, 1),
      terms: '30',
    );

    expect(invoiceUseCaseModel.paymentDueFormatted, equals('31 Jan 2021'));
  });

  test('uiEnum draft is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      status: InvoiceStatus.draft,
    );

    expect(invoiceUseCaseModel.uiEnum, equals(AppInvoiceStatus.draft));
  });

  test('uiEnum pending is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      status: InvoiceStatus.pending,
    );

    expect(invoiceUseCaseModel.uiEnum, equals(AppInvoiceStatus.pending));
  });

  test('uiEnum paid is correct', () async {
    final invoiceUseCaseModel = InvoiceUseCaseModel.empty().copyWith(
      status: InvoiceStatus.paid,
    );

    expect(invoiceUseCaseModel.uiEnum, equals(AppInvoiceStatus.paid));
  });

  test('InvoiceStatus.fromServerValue draft is correct', () async {
    expect(InvoiceStatus.fromServerValue('draft'), equals(InvoiceStatus.draft));
  });

  test('InvoiceStatus.fromServerValue paid is correct', () async {
    expect(InvoiceStatus.fromServerValue('paid'), equals(InvoiceStatus.paid));
  });

  test('InvoiceStatus.fromServerValue pending is correct', () async {
    expect(InvoiceStatus.fromServerValue('pending'),
        equals(InvoiceStatus.pending));
  });

  test('InvoiceStatus.fromServerValue unknown is correct', () async {
    expect(() => InvoiceStatus.fromServerValue('unknown'), throwsException);
  });

  test('InvoiceStatus.label draft is correct', () async {
    expect(InvoiceStatus.draft.label, equals('Draft'));
  });

  test('InvoiceStatus.label pending is correct', () async {
    expect(InvoiceStatus.pending.label, equals('Pending'));
  });

  test('InvoiceStatus.label paid is correct', () async {
    expect(InvoiceStatus.paid.label, equals('Paid'));
  });

  test('InvoiceStatus.serverValue draft is correct', () async {
    expect(InvoiceStatus.draft.serverValue, equals('draft'));
  });

  test('InvoiceStatus.serverValue paid is correct', () async {
    expect(InvoiceStatus.paid.serverValue, equals('paid'));
  });

  test('InvoiceStatus.serverValue pending is correct', () async {
    expect(InvoiceStatus.pending.serverValue, equals('pending'));
  });

  test('InvoiceStatus.fromLabel Draft is correct', () async {
    expect(InvoiceStatus.fromLabel('Draft'), equals(InvoiceStatus.draft));
  });

  test('InvoiceStatus.fromLabel Pending is correct', () async {
    expect(InvoiceStatus.fromLabel('Pending'), equals(InvoiceStatus.pending));
  });

  test('InvoiceStatus.fromLabel Paid is correct', () async {
    expect(InvoiceStatus.fromLabel('Paid'), equals(InvoiceStatus.paid));
  });

  test('InvoiceStatus.fromLabel Unknown is correct', () async {
    expect(() => InvoiceStatus.fromLabel('Unknown'), throwsException);
  });
}
