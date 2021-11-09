import 'package:flutter/material.dart';

enum TextStyledTypes { title, label, successTag, errorTag, button, body }

class StyledText extends StatelessWidget {
  final String _text;
  final TextStyledTypes type;

  const StyledText(
      this._text, {
        Key? key,
        required this.type,
      }) : super(key: key);

  TextStyle _getStyle(TextStyledTypes styledType) {
    switch (styledType) {
      case TextStyledTypes.title:
        return TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
      case TextStyledTypes.body:
        return TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
      case TextStyledTypes.label:
        return TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color.fromRGBO(128, 128, 128, 1));
      case TextStyledTypes.errorTag:
        return TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color.fromRGBO(210, 38, 38, 1));
      case TextStyledTypes.button:
        return TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromRGBO(86, 128, 255, 1));
      default:
        return TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this._text,
      style: _getStyle(this.type),
    );
  }
}