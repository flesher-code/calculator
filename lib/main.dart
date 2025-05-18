import 'package:flutter/material.dart';
import './button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(body: Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String value1 = '';
  String value2 = '';
  String operation = '';
  num result = 0;
  final listOperators = ['+', '-', '/', 'x'];
  String history = '';

  void clearAll() {
    setState(() {
      value1 = '';
      value2 = '';
      operation = '';
      result = 0;
      history = '';
    });
  }

  void appendDigit(int digit) {
    if (operation.isEmpty) {
      value1 = value1 += digit.toString();
    } else {
      value2 = value2 += digit.toString();
    }
    setState(() {
      history = history + digit.toString();
    });
  }

  void setOperation(String op) {
    setState(() {
      operation = op;
      history = history + op;
    });
  }

  void calculateResult() {
    final num num1 = num.parse(value1);
    final num num2 = num.parse(value2);

    setState(() {
      switch (operation) {
        case '+':
          result = num1 + num2;
        case '-':
          result = num1 - num2;
        case 'x':
          result = num1 * num2;
        case '/':
          result = num1 / num2;
        default:
          result = 0;
      }
      result = num.parse(result.toStringAsFixed(3));
      value1 = '';
      value2 = '';
      operation = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double sized;
    late double? coff;

    coff = 4;
    switch (myHeight) {
      case > 1000:
        coff = coff;
      case > 900:
        coff += 1;
      case > 825:
        coff += 3;
      case > 725:
        coff += 6;
      case <= 725:
        coff = null;
    }

    sized = (coff == null) ? 0 : myHeight / coff;
    debugPrint('h: $myHeight s: $sized');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 330,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                'RESULT: $result',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 330,
          height: 60,

          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                history.isEmpty ? 'Empty...' : history,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        SizedBox(height: sized),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int a = 0; a <= 3; a++)
              CalculatorButton(
                label: listOperators[a],
                onPressed: () => setOperation(listOperators[a]),
                isAction: true,
              ),
          ],
        ),
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int f = 1; f <= 3; f++)
                CalculatorButton(
                  label: '${i * 3 + f}',
                  onPressed: () => appendDigit(i * 3 + f),
                ),
            ],
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 125,
              height: 75,
              child: CalculatorButton(
                label: 'del',
                onPressed: clearAll,
                isAction: true,
              ),
            ),
            CalculatorButton(label: '0', onPressed: () => appendDigit(0)),
            SizedBox(
              width: 125,
              height: 75,
              child: CalculatorButton(
                label: 'done',
                onPressed: () => calculateResult(),
                isAction: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
