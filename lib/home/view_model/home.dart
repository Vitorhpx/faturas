import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/model/payment_options_model.dart';

enum InvoiceStatus { overdue, open }

class HomeViewModel {
  final PaymentOptionsModel _paymentOptionsModel;

  HomeViewModel(this._paymentOptionsModel);

  Future<List<PaymentOption>> get paymentOptions => _paymentOptionsModel.paymentOptions;

  double get invoiceValue =>
      _paymentOptionsModel.invoiceValue;

  DateTime get invoiceDueDate =>
      _paymentOptionsModel.invoiceDueDate;


  InvoiceStatus get invoiceStatus {
    if(invoiceDueDate.compareTo(DateTime.now()) < 0){
      return InvoiceStatus.overdue;
    }
    return InvoiceStatus.open;
  }
}
