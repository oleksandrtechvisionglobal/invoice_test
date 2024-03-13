import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/data/use_case/invoice_use_case_provider.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:invoice/providers/shared_preferences_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}

void main() {
  late final ProviderContainer container;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final prefsInstance = await SharedPreferences.getInstance();

    container = createContainer(overrides: [
      sharedPreferencesProvider.overrideWithValue(prefsInstance),
    ]);
  });

  group('Invoice UseCase test', () {
    test('Saving invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceUseCase.saveInvoice(invoiceData);

      final savedInvoice = await invoiceUseCase.getInvoiceById('1');

      expect(savedInvoice!.id, equals(invoiceData.id));
    });

    test('Deleting invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceUseCase.saveInvoice(invoiceData);

      await invoiceUseCase.deleteInvoice('1');

      final savedInvoice = await invoiceUseCase.getInvoiceById('1');

      expect(savedInvoice, equals(null));
    });

    test('Marking invoice as paid is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceUseCase.saveInvoice(invoiceData);

      await invoiceUseCase.markAsPaid(invoiceData);

      final savedInvoice = await invoiceUseCase.getInvoiceById('1');

      expect(savedInvoice!.status, equals(InvoiceStatus.paid));
    });

    test('Saving invoice as draft is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceUseCase.saveInvoice(invoiceData);

      await invoiceUseCase.saveAsDraft(invoiceData);

      final savedInvoice = await invoiceUseCase.getInvoiceById('1');

      expect(savedInvoice!.status, equals(InvoiceStatus.draft));
    });

    test('Saving invoice as pending is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceUseCase.saveInvoice(invoiceData);

      await invoiceUseCase.saveAsPending(invoiceData);

      final savedInvoice = await invoiceUseCase.getInvoiceById('1');

      expect(savedInvoice!.status, equals(InvoiceStatus.pending));
    });

    test('Getting all invoices is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceUseCase = container.read(invoiceUseCaseProvider);

      final InvoiceUseCaseModel invoiceData1 =
          InvoiceUseCaseModel.empty().copyWith(id: '1');
      final InvoiceUseCaseModel invoiceData2 =
          InvoiceUseCaseModel.empty().copyWith(id: '2');

      await invoiceUseCase.saveInvoice(invoiceData1);
      await invoiceUseCase.saveInvoice(invoiceData2);

      final savedInvoices = await invoiceUseCase.getInvoices();

      expect(savedInvoices.length, equals(2));
    });
  });
}
