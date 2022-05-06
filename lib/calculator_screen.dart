import 'package:example/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, result, child) => Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    result.screenList.isNotEmpty ? result.screenList.last : '',
                    style: const TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 18,
                    ),
                  ),
                ),
                color: Colors.grey[400],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result.errorDisplay),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result.answerDisplay),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
