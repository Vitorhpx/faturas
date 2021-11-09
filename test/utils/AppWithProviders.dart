import 'package:faturas/shared/model/payment_options_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWithProviders extends StatelessWidget {
  final Widget _homeWidget;
  const AppWithProviders(this._homeWidget, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => PaymentOptionsModel(4775.00, DateTime.now().subtract(Duration(days: 1))))
        ],
        child: MaterialApp(
          title: 'Sistema de Faturas',
          home: _homeWidget,
        ));
  }
}