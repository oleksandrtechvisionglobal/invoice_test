import 'package:invoice/data/repo/invoice_repo.dart';
import 'package:invoice/models/repo/invoice_repo_model.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';

import 'invoice_use_case.dart';

class InvoiceUseCaseImpl implements InvoiceUseCase {
  final InvoiceRepo _invoiceRepo;

  InvoiceUseCaseImpl(this._invoiceRepo);

  @override
  Future<void> deleteInvoice(String id) {
    return _invoiceRepo.deleteInvoice(id);
  }

  @override
  Future<InvoiceUseCaseModel?> getInvoiceById(String id) async {
    final invoice = await _invoiceRepo.getInvoiceById(id);
    if (invoice == null) return null;
    return InvoiceUseCaseModel.fromRepoModel(invoice);
  }

  @override
  Future<List<InvoiceUseCaseModel>> getInvoices() async {
    return (await _invoiceRepo.getInvoices())
        .map((e) => InvoiceUseCaseModel.fromRepoModel(e))
        .toList();
  }

  @override
  Future<void> saveInvoice(InvoiceUseCaseModel invoice) async {
    return _invoiceRepo.saveInvoice(InvoiceRepoModel.fromUseCaseModel(invoice));
  }

  @override
  Future<void> markAsPaid(InvoiceUseCaseModel invoice) {
    return _invoiceRepo.saveInvoice(InvoiceRepoModel.fromUseCaseModel(
        invoice.copyWith(status: InvoiceStatus.paid)));
  }

  @override
  Future<void> saveAsDraft(InvoiceUseCaseModel invoice) {
    return _invoiceRepo.saveInvoice(InvoiceRepoModel.fromUseCaseModel(
        invoice.copyWith(status: InvoiceStatus.draft)));
  }

  @override
  Future<void> saveAsPending(InvoiceUseCaseModel invoice) {
    return _invoiceRepo.saveInvoice(InvoiceRepoModel.fromUseCaseModel(
        invoice.copyWith(status: InvoiceStatus.pending)));
  }
}
