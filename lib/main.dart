import 'package:faturas/home/view/screens/home.dart';
import 'package:faturas/payment-options/repository/rest/payment_options_rest_service.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/model/payment_options_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  GetIt.I.registerSingleton<PaymentOptionsRestService>(PaymentOptionsRestService());
  runApp(InvoicesApp());
}

class InvoicesApp extends StatelessWidget {
  const InvoicesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => PaymentOptionsModel(4775.00, DateTime.now().subtract(Duration(days: 1))))
        ],
        child: MaterialApp(
          title: 'Sistema de Faturas',
          home: HomeScreen(),
        ));
  }
}
