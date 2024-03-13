import 'package:invoice/data/repo/invoice_repo_provider.dart';
import 'package:invoice/data/use_case/invoice_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'invoice_use_case_impl.dart';

part 'invoice_use_case_provider.g.dart';

@riverpod
InvoiceUseCase invoiceUseCase(InvoiceUseCaseRef ref) {
  return InvoiceUseCaseImpl(ref.read(invoiceRepoProvider));
}
