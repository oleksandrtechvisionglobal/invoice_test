import 'package:invoice/data/data_sources/invoice_data_source_provider.dart';
import 'package:invoice/data/repo/invoice_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'invoice_repo_impl.dart';

part 'invoice_repo_provider.g.dart';

@riverpod
InvoiceRepo invoiceRepo(InvoiceRepoRef ref) {
  return InvoiceRepoImpl(ref.read(invoiceDataSourceProvider));
}
