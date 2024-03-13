import 'package:invoice/models/repo/invoice_repo_model.dart';

abstract class InvoiceRepo {
  Future<InvoiceRepoModel?> getInvoiceById(String id);

  Future<void> saveInvoice(InvoiceRepoModel invoice);

  Future<void> deleteInvoice(String id);

  Future<List<InvoiceRepoModel>> getInvoices();
}
