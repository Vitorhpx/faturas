import 'package:flutter/material.dart';

class OutlinedButtonStyled extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const OutlinedButtonStyled({
    Key? key,
    required this.text,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
        ),
        child: Text(
          this.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromRGBO(86, 128, 255, 1)),
        ),
      ),
    );
  }
}