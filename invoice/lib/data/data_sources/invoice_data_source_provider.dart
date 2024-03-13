import 'package:invoice/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'invoice_data_source.dart';
import 'invoice_data_source_impl.dart';

part 'invoice_data_source_provider.g.dart';

@riverpod
InvoiceDataSource invoiceDataSource(InvoiceDataSourceRef ref) {
  return InvoiceDataSourceImpl(ref.read(sharedPreferencesProvider));
}
