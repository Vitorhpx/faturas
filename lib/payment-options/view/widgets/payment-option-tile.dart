import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/view/utils/currency.dart';
import 'package:flutter/material.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentOption _paymentOption;
  final PaymentOption? _selectedPaymentOption;
  final Function(PaymentOption?) _onChange;

  _getFormattedTitle() {
    return '${_paymentOption.number}x ${nf.format(_paymentOption.value)}';
  }

  _getFormattedTotal() {
    return '${nf.format(_paymentOption.total)}';
  }

  const PaymentOptionTile(
      this._paymentOption, this._selectedPaymentOption, this._onChange,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RadioListTile(
          value: this._paymentOption,
          groupValue: this._selectedPaymentOption,
          onChanged: this._onChange,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_getFormattedTitle()),
              Text(_getFormattedTotal()),
            ],
          )),
    );
  }
}
