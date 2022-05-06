import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String screenDisplay = '';
  String errorDisplay = '';
  String buttonText = '';
  String sign = '';
  String answerDisplay = '';

  List screenList = [];
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  List buttonIdentifier = [];

  void which(String button) {
    if (button == 'C' ||
        button == 'CE' ||
        button == String.fromCharCode(0X21D0)) {
      screenList;
    } else {
      screenDisplay += button;

      screenList.add(screenDisplay);

      notifyListeners();
    }
  }

  void whichExcept(String button) {
    try {
      if (button == '=' ||
          button == 'C' ||
          button == 'CE' ||
          button == String.fromCharCode(0X21D0)) {
        operation(button);
        buttonIdentifier;
        buttonText = '';
        firstNumber = buttonIdentifier.isEmpty
            ? 0.0
            : double.parse(buttonIdentifier.last);
      } else if (button == '/') {
        sign = '/';
        buttonIdentifier;
        buttonText = '';
        firstNumber = double.parse(buttonIdentifier.last);
      } else if (button == 'X') {
        sign = 'X';
        buttonIdentifier;
        buttonText = '';
        firstNumber = double.parse(buttonIdentifier.last);
      } else if (button == '+') {
        sign = '+';
        buttonIdentifier;
        buttonText = '';
        firstNumber = double.parse(buttonIdentifier.last);
      } else if (button == String.fromCharCode(0X2013)) {
        sign = '-';
        buttonIdentifier;
        buttonText = '';
        firstNumber = double.parse(buttonIdentifier.last);
      } else if (button == '%') {
        sign = '%';
        buttonIdentifier;
        buttonText = '';
        firstNumber = double.parse(buttonIdentifier.last);
      } else {
        buttonText += button;

        buttonIdentifier.add(buttonText);

        secondNumber = double.parse(buttonIdentifier.last);
        notifyListeners();
      }
    } catch (e) {
      errorDisplay = e.toString();
    }
  }

  void operation(String but) {
    if (but == '=') {
      switch (sign) {
        case 'X':
          answerDisplay = (firstNumber * secondNumber).toStringAsFixed(3);
          break;

        case '/':
          answerDisplay = (firstNumber / secondNumber).toStringAsFixed(3);
          break;
        case '+':
          answerDisplay = (firstNumber + secondNumber).toStringAsFixed(3);
          break;
        case '-':
          answerDisplay = (firstNumber - secondNumber).toStringAsFixed(3);
          break;
        case '%':
          answerDisplay = (firstNumber % secondNumber).toStringAsFixed(3);
          break;
        default:
      }

      notifyListeners();
    } else if (but == 'C') {
      screenList.clear();
      answerDisplay = '';
      screenDisplay = '';
      notifyListeners();
    } else if (but == 'CE') {
      screenList.clear();
      answerDisplay = '';
      screenDisplay = '';
      notifyListeners();
    } else if (but == String.fromCharCode(0X21D0)) {
      screenList.removeAt(screenList.length - 1);
      screenDisplay = screenList.isEmpty ? '' : screenList.last;
      buttonIdentifier.removeAt(buttonIdentifier.length - 1);
      notifyListeners();
    }
  }
}
