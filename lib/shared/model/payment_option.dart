class PaymentOption {
  final int number;
  final double value;
  final double total;

  PaymentOption(this.number, this.value, this.total);

  PaymentOption.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        value = double.parse(json['value'].toString()),
        total = double.parse(json['total'].toString());

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + number.hashCode;
    result = 37 * result + value.hashCode;
    result = 37 * result + total.hashCode;
    return result;
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }

}
