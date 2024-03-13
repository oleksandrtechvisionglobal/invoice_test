import 'package:invoice/data/use_case/invoice_use_case_provider.dart';
import 'package:invoice/data/vm/invoice_vm.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_invoice_vm.g.dart';

@riverpod
class SingleInvoiceVM extends _$SingleInvoiceVM {
  @override
  InvoiceUseCaseModel? build() {
    return null;
  }

  Future<void> loadInvoice(String id) async {
    final invoice = await ref.read(invoiceUseCaseProvider).getInvoiceById(id);
    state = invoice;
  }

  Future<void> reloadInvoice() async {
    if (state == null) return;
    final invoice =
        await ref.read(invoiceUseCaseProvider).getInvoiceById(state!.id);
    state = invoice;
  }

  void loadEmptyInvoice() {
    state = InvoiceUseCaseModel.empty();
  }

  Future<void> deleteInvoice(String id) async {
    await ref.read(invoiceUseCaseProvider).deleteInvoice(id);
    ref.read(invoiceVMProvider.notifier).loadInvoices();
  }

  Future<void> saveInvoice(InvoiceUseCaseModel invoice) async {
    await ref.read(invoiceUseCaseProvider).saveInvoice(invoice);
    ref.read(invoiceVMProvider.notifier).loadInvoices();
    reloadInvoice();
  }

  Future<void> markAsPaid(InvoiceUseCaseModel invoice) async {
    await ref.read(invoiceUseCaseProvider).markAsPaid(invoice);
    ref.read(invoiceVMProvider.notifier).loadInvoices();
    reloadInvoice();
  }

  Future<void> saveAsDraft(InvoiceUseCaseModel invoice) async {
    await ref.read(invoiceUseCaseProvider).saveAsDraft(invoice);
    ref.read(invoiceVMProvider.notifier).loadInvoices();
    reloadInvoice();
  }

  Future<void> saveAsPending(InvoiceUseCaseModel invoice) async {
    await ref.read(invoiceUseCaseProvider).saveAsPending(invoice);
    ref.read(invoiceVMProvider.notifier).loadInvoices();
    reloadInvoice();
  }
}
