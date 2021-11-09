import 'package:faturas/payment-options/repository/rest/payment_options_rest_service.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final PaymentOptionsRestService paymentOptionsRestService = GetIt.I<PaymentOptionsRestService>();

class PaymentOptionsModel extends ChangeNotifier {
  final double _invoiceValue;
  final DateTime _invoiceDueDate;

  PaymentOption? _selectedPaymentOption;

  List<PaymentOption> _innerPaymentOptions = [];

  PaymentOptionsModel(
      this._invoiceValue, this._invoiceDueDate);

  Future<List<PaymentOption>> get paymentOptions async {
    if(this._innerPaymentOptions.isEmpty) {
      _innerPaymentOptions = await paymentOptionsRestService.fetchPaymentOptions();
      _selectedPaymentOption = _innerPaymentOptions[0];
      return _innerPaymentOptions;
    }
    return _innerPaymentOptions;
  }

  set selectedPaymentOption(PaymentOption? paymentOption) {
    _selectedPaymentOption = paymentOption;
    notifyListeners();
  }

  PaymentOption? get selectedPaymentOption => this._selectedPaymentOption;

  double get invoiceValue => _invoiceValue;

  DateTime get invoiceDueDate => _invoiceDueDate;

}
