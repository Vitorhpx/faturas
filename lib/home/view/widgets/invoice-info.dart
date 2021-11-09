import 'package:faturas/home/view_model/home.dart';
import 'package:faturas/shared/view/widgets/text-styled.dart';
import 'package:flutter/material.dart';


class InvoiceInfo extends StatelessWidget {
  final double value;
  final DateTime expirationDate;
  final InvoiceStatus status;

  String _getInvoiceLabel(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.overdue:
        return "Vencida";
      case InvoiceStatus.open:
        return "Aberta";
    }
  }

  const InvoiceInfo({
    Key? key,
    required this.value,
    required this.expirationDate,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText(
              "R\$ ${this.value.toStringAsFixed(2).replaceFirst('.', ',')}",
              type: TextStyledTypes.body,
            ),
            StyledText(
              "Vencimento ${this.expirationDate.day}/${this.expirationDate.month}/${this.expirationDate.year}",
              type: TextStyledTypes.label,
            ),
          ],
        ),
        Column(
          children: [
            StyledText(
              _getInvoiceLabel(this.status),
              type: TextStyledTypes.errorTag,
            ),
          ],
        )
      ],
    );
  }
}