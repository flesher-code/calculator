import 'package:flutter/material.dart';
import './button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [SizedBox(height: 30), Buttons()])),
    );
  }
}

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

String value1 = '';
String value2 = '';
String valueAction = '';
int resoult = 0;
bool resetResoult = false;

class _ButtonsState extends State<Buttons> {
  void clearAll() {
    setState(() {
      value1 = '';
      value2 = '';
      valueAction = '';
      resoult = 0;
    });
  }

  void action(String action) {
    valueAction = action;
  }

  void getResoult() {
    int num1;
    int num2;
    try {
      num1 = int.parse(value1);
      num2 = int.parse(value2);
    } catch (e) {
      num1 = 0;
      num2 = 0;
    }
    switch (valueAction) {
      case '+':
        setState(() {
          resoult = num1 + num2;
        });
      case '-':
        setState(() {
          resoult = num1 - num2;
        });
    }
    value1 = '';
    value2 = '';
    valueAction = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardResoult(),
        SizedBox(height: 400),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(buttonIndex: 1),
            MyButton(buttonIndex: 2),
            MyButton(buttonIndex: 3),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(buttonIndex: 4),
            MyButton(buttonIndex: 5),
            MyButton(buttonIndex: 6),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(buttonIndex: 7),
            MyButton(buttonIndex: 8),
            MyButton(buttonIndex: 9),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            MyAction(action: '+'),
            MyAction(action: '-'),

            Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: 120,
                height: 55,
                child: OutlinedButton(
                  onPressed: () => clearAll(),
                  child: Text('X'),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              height: 50,
              child: OutlinedButton(
                onPressed: () => getResoult(),
                child: Text('done'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardResoult extends StatelessWidget {
  var cardText = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  CardResoult({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Text('RESOULT: $resoult', style: cardText),
      ),
    );
  }
}
