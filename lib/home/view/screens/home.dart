import 'package:faturas/home/view/widgets/invoice-info.dart';
import 'package:faturas/home/view_model/home.dart';
import 'package:faturas/payment-options/view/screens/payment_options.dart';
import 'package:faturas/shared/model/payment_options_model.dart';
import 'package:faturas/shared/view/widgets/blank-spacer.dart';
import 'package:faturas/shared/view/widgets/outlined-button-styled.dart';
import 'package:faturas/shared/view/widgets/text-styled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ProxyProvider<PaymentOptionsModel, HomeViewModel>(
        create: (context) =>
            HomeViewModel(context.read<PaymentOptionsModel>()),
        update: (context, paymentOptionsModel, notifier) =>
            HomeViewModel(context.read<PaymentOptionsModel>()),
      )
    ], child: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.select(
          (HomeViewModel viewModel) => viewModel,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sistema de Faturas'),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(
                      "Última fatura",
                      type: TextStyledTypes.title,
                    ),
                    BlankSpacer(SpacerSize.large),
                    InvoiceInfo(
                      value: viewModel.invoiceValue,
                      status: viewModel.invoiceStatus,
                      expirationDate: viewModel.invoiceDueDate,
                    ),
                    BlankSpacer(SpacerSize.small),
                    Divider(),
                    BlankSpacer(SpacerSize.small),
                    StyledText(
                      "Formas de pagamento",
                      type: TextStyledTypes.title,
                    ),
                    BlankSpacer(SpacerSize.medium),
                    StyledText(
                      "Boleto Bancário",
                      type: TextStyledTypes.label,
                    ),
                    BlankSpacer(SpacerSize.small),
                    OutlinedButtonStyled(
                      text: "Copiar código de barras do boleto",
                    ),
                    BlankSpacer(SpacerSize.small),
                    OutlinedButtonStyled(
                      text: "Enviar boleto por e-mail",
                    ),
                    SizedBox(height: 20),
                    StyledText(
                      "Cartão de Crédito",
                      type: TextStyledTypes.label,
                    ),
                    BlankSpacer(SpacerSize.small),
                    OutlinedButtonStyled(
                      text: "Pagar com cartão de crédito",
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentOptionsScreen())),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
