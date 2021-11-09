import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/model/payment_options_model.dart';

class PaymentOptionsViewModel {
  final PaymentOptionsModel _paymentOptionsModel;

  PaymentOptionsViewModel(this._paymentOptionsModel);

  Future<List<PaymentOption>> get paymentOptions =>
      _paymentOptionsModel.paymentOptions;

  PaymentOption? get selectedPaymentOption =>
      _paymentOptionsModel.selectedPaymentOption;

  set selectedPaymentOption(PaymentOption? option) =>
      _paymentOptionsModel.selectedPaymentOption = option;

  double get invoiceValue => _paymentOptionsModel.invoiceValue;

  double get operationTax {
    if (selectedPaymentOption != null) {
      return (selectedPaymentOption!.number * selectedPaymentOption!.value) -
          invoiceValue;
    }
    return 0.0;
  }
}
