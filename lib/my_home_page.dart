import 'package:flutter/material.dart';

import 'button_screen.dart';
import 'calculator_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  final List operation = [0, 1, 2, 3, 7, 11, 15, 19];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            child: const CalculatorScreen(),
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SizedBox(
            child: ButtonScreen(operation: operation),
            height: MediaQuery.of(context).size.height * 0.65,
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
      drawer: const Drawer(),
    );
  }
}
