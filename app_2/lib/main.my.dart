import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Flutter Demo 2',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void onPressed() {
    log('ouiiiiii');
  }

  @override
  Widget build(context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/quiz-logo.png')),
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              ),
              OutlinedButton(
                onPressed: onPressed,
                child: const Text(
                  "Start quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
