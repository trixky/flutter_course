import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // StyledText(String text, {super.key}): outputText = text;
  // String outputText;

  const StyledText(this.text, {super.key});

  final String text;
  // String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.brown,
        fontSize: 28,
      ),
    );
  }
}
