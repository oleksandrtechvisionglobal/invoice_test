import 'package:invoice/data/data_sources/invoice_data_source.dart';
import 'package:invoice/data/repo/invoice_repo.dart';
import 'package:invoice/models/data_sources/invoice_data_source_model.dart';
import 'package:invoice/models/repo/invoice_repo_model.dart';

class InvoiceRepoImpl implements InvoiceRepo {
  final InvoiceDataSource _dataSource;

  InvoiceRepoImpl(this._dataSource);

  @override
  Future<void> deleteInvoice(String id) async {
    return _dataSource.deleteInvoice(id);
  }

  @override
  Future<InvoiceRepoModel?> getInvoiceById(String id) async {
    final invoice = await _dataSource.getInvoiceById(id);
    if (invoice == null) return null;
    return InvoiceRepoModel.fromDataSource(invoice);
  }

  @override
  Future<List<InvoiceRepoModel>> getInvoices() async {
    final invoices = await _dataSource.getInvoices();
    return invoices.map((e) => InvoiceRepoModel.fromDataSource(e)).toList();
  }

  @override
  Future<void> saveInvoice(InvoiceRepoModel invoice) async {
    return _dataSource
        .saveInvoice(InvoiceDataSourceModel.fromRepoModel(invoice));
  }
}
