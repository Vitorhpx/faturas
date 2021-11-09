import 'dart:convert';

import 'package:faturas/shared/model/payment_option.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PaymentOptionsRestService {
  final _client = http.Client();

  Future<List<PaymentOption>> fetchPaymentOptions() async {
    Response response = await _client.get(Uri.parse(
        'https://dreamy-allen-2e1b47.netlify.app/payment-options.json'));

    return List<PaymentOption>.from(jsonDecode(response.body)['options']
            ['installments']
        .map((installment) => PaymentOption.fromJson(installment)));
  }
}
