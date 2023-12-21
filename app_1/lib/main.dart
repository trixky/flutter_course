import 'package:flutter/material.dart';
import 'package:app_1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(199, 199, 64, 64),
        // backgroundColor: Colors.blueGrey,
        body: GradientContainer(Colors.blue, Colors.black)
        // body: GradientContainer.purple()
      ),
    ),
  );
}

