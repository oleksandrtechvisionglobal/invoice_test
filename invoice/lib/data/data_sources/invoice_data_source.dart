import 'package:invoice/models/data_sources/invoice_data_source_model.dart';

abstract class InvoiceDataSource {
  Future<InvoiceDataSourceModel?> getInvoiceById(String id);

  Future<void> saveInvoice(InvoiceDataSourceModel invoice);

  Future<void> deleteInvoice(String id);

  Future<List<InvoiceDataSourceModel>> getInvoices();
}
