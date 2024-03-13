import 'package:invoice/data/use_case/invoice_use_case_provider.dart';
import 'package:invoice/models/use_case/invoice_use_case_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invoice_vm.g.dart';

@riverpod
class InvoiceVM extends _$InvoiceVM {
  @override
  List<InvoiceUseCaseModel> build() {
    return [];
  }

  void loadInvoices() async {
    final invoices = await ref.read(invoiceUseCaseProvider).getInvoices();
    state = invoices;
  }
}
