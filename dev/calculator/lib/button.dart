import 'package:flutter/material.dart';
import 'main.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.buttonIndex, theme});

  int buttonIndex;
  var theme;

  void valueToMain() {
    if (valueAction.isEmpty) {
      value1 = value1 + buttonIndex.toString();
    } else {
      value2 = value2 + buttonIndex.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: 120,
        height: 70,
        child: ElevatedButton(
          onPressed: () => valueToMain(),
          child: Text('$buttonIndex'),
          style: theme,
        ),
      ),
    );
  }
}

class MyAction extends StatelessWidget {
  MyAction({super.key, required this.action});

  String action;

  void actionToMain() {
    valueAction = action;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: 120,
        height: 55,
        child: OutlinedButton(
          onPressed: () => actionToMain(),
          child: Text(action),
        ),
      ),
    );
  }
}
