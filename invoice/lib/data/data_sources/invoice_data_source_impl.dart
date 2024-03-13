import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:invoice/models/data_sources/invoice_data_source_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'invoice_data_source.dart';

class InvoiceDataSourceImpl implements InvoiceDataSource {
  static const _invoiceKey = 'invoice';
  final SharedPreferences _sharedPreferences;

  InvoiceDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> deleteInvoice(String id) async {
    final invoices = await getInvoices();
    final newInvoices = invoices.where((element) => element.id != id).toList();
    await _sharedPreferences.setStringList(
      _invoiceKey,
      newInvoices.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  @override
  Future<InvoiceDataSourceModel?> getInvoiceById(String id) async {
    final invoices = await getInvoices();
    return invoices.firstWhereOrNull((element) => element.id == id);
  }

  @override
  Future<List<InvoiceDataSourceModel>> getInvoices() async {
    final invoices = _sharedPreferences.getStringList(_invoiceKey);
    if (invoices == null) return [];
    return invoices
        .map((e) => InvoiceDataSourceModel.fromJson(jsonDecode(e)))
        .toList();
  }

  @override
  Future<void> saveInvoice(InvoiceDataSourceModel invoice) async {
    final invoices = await getInvoices();
    final index = invoices.indexWhere((element) => element.id == invoice.id);
    if (index == -1) {
      invoices.add(invoice);
    } else {
      invoices[index] = invoice;
    }
    await _sharedPreferences.setStringList(
      _invoiceKey,
      invoices.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }
}
