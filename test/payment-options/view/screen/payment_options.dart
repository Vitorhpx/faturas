// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:faturas/payment-options/repository/rest/payment_options_rest_service.dart';
import 'package:faturas/payment-options/view/screens/payment_options.dart';
import 'package:faturas/shared/model/payment_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/AppWithProviders.dart';
import '../../repository/rest/payment_options_rest_service.dart';

void main() {

  setUp(() {
    var paymentOptionsRestService = PaymentOptionsRestServiceMock();

    when(paymentOptionsRestService.fetchPaymentOptions()).thenAnswer((_) =>
        Future.value(
            List<PaymentOption>.from([PaymentOption(1, 1000.0, 1000.0)])));

    GetIt.I.registerSingleton<PaymentOptionsRestService>(paymentOptionsRestService);

  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AppWithProviders(PaymentOptionsScreen()));

    // Verify that our counter starts at 0.
    expect(find.text('Escolha o número de parcelas:'), findsOneWidget);

    await tester.pump();

    expect(find.text('1x R\$ 1.000,00'), findsOneWidget);
  });
}
