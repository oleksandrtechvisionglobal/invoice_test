import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invoice/data/vm/single_invoice_vm.dart';
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

  group('Single invoice VM test', () {
    test('Saving invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state!.id, equals(invoiceData.id));
    });

    test('Deleting invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      await invoiceVM.deleteInvoice('1');

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state, equals(null));
    });

    test('Loading invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state!.id, equals(invoiceData.id));
    });

    test('Marking invoice as paid is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      await invoiceVM.markAsPaid(invoiceData);

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state!.status, InvoiceStatus.paid);
    });

    test('Saving invoice as draft is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      await invoiceVM.saveAsDraft(invoiceData);

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state!.status, InvoiceStatus.draft);
    });

    test('Updating invoice is correct', () async {
      SharedPreferences.setMockInitialValues({});
      final invoiceVM = container.read(singleInvoiceVMProvider.notifier);

      final InvoiceUseCaseModel invoiceData =
          InvoiceUseCaseModel.empty().copyWith(id: '1');

      await invoiceVM.saveInvoice(invoiceData);

      final updatedInvoiceData =
          invoiceData.copyWith(projectDescription: 'New project description');

      await invoiceVM.saveInvoice(updatedInvoiceData);

      await invoiceVM.loadInvoice('1');

      expect(invoiceVM.state!.projectDescription,
          equals('New project description'));
    });
  });
}
