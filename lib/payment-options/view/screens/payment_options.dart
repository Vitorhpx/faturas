import 'package:faturas/shared/model/payment_option.dart';
import 'package:faturas/shared/model/payment_options_model.dart';
import 'package:faturas/payment-options/view/widgets/payment-option-tile.dart';
import 'package:faturas/payment-options/view_model/payment_options.dart';
import 'package:faturas/shared/view/utils/currency.dart';
import 'package:faturas/shared/view/widgets/blank-spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<PaymentOptionsModel, PaymentOptionsViewModel>(
      create: (context) =>
          PaymentOptionsViewModel(context.read<PaymentOptionsModel>()),
      update: (context, paymentOptionsModel, notifier) =>
          PaymentOptionsViewModel(context.read<PaymentOptionsModel>()),
      child:  PaymentOptionsWidget(),
    );
  }
}

class PaymentOptionsWidget extends StatelessWidget {
  const PaymentOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.select(
      (PaymentOptionsViewModel viewModel) => viewModel,
    );
    final operationTax = nf.format(viewModel.operationTax);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento da fatura'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Escolha o número de parcelas:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16))),
              Expanded(
                child: FutureBuilder(
                    future: viewModel.paymentOptions,
                    builder:
                        (context, AsyncSnapshot<List<PaymentOption>> options) {
                      if (options.hasData) {
                        return ListView.builder(
                            itemCount: options.data!.length,
                            itemBuilder: (context, indice) {
                              final paymentOption = options.data![indice];
                              return PaymentOptionTile(paymentOption,
                                  viewModel.selectedPaymentOption, (value) {
                                if (value != null) {
                                  viewModel.selectedPaymentOption = value;
                                }
                              });
                            });
                      }
                      return Column(
                        children: [
                          BlankSpacer(SpacerSize.large),
                          SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                        ],
                      );
                    }),
              ),
              Divider(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Fatura de junho",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              "${nf.format(viewModel.invoiceValue)}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Taxa da operação",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              "$operationTax",
                              key: Key("tax"),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Voltar")),
                  Spacer(),
                  Text("1 de 3"),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint("Continuar...");
                      },
                      child: Text("Continuar"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
