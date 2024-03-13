import 'package:invoice/models/use_case/invoice_use_case_model.dart';

abstract class InvoiceUseCase {
  Future<InvoiceUseCaseModel?> getInvoiceById(String id);

  Future<void> saveInvoice(InvoiceUseCaseModel invoice);

  Future<void> deleteInvoice(String id);

  Future<List<InvoiceUseCaseModel>> getInvoices();

  Future<void> markAsPaid(InvoiceUseCaseModel invoice);

  Future<void> saveAsDraft(InvoiceUseCaseModel invoice);

  Future<void> saveAsPending(InvoiceUseCaseModel invoice);
}
