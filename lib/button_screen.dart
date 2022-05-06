import 'package:example/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({
    Key key,
    @required this.operation,
  }) : super(key: key);

  final List operation;

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

final Map<int, String> buttonScreen = {
  0: '%',
  1: 'CE',
  2: 'C',
  3: String.fromCharCode(0X21D0),
  4: '1/x',
  5: 'x${String.fromCharCode(0X00B2)}',
  6: String.fromCharCode(0X221A),
  7: '/',
  8: '7',
  9: '8',
  10: '9',
  11: 'X',
  12: '4',
  13: '5',
  14: '6',
  15: String.fromCharCode(0X2013),
  16: '1',
  17: '2',
  18: '3',
  19: '+',
  20: "+/-",
  21: '0',
  22: '.',
  23: '='
};

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) => Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 8),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 24,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            mainAxisExtent: 73,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  data.which(
                    buttonScreen[index].toString(),
                  );
                  data.whichExcept(
                    buttonScreen[index].toString(),
                  );
                });
              },
              child: Container(
                width: 10,
                height: 10,
                child: Center(
                  child: Text(
                    buttonScreen[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.operation.contains(index)
                      ? Colors.amber
                      : index == 23
                          ? Colors.blue[800]
                          : Colors.grey[850],
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
