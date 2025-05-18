import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isAction = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: isAction ? 90 : 125,
        height: isAction ? 55 : 75,
        child:
            isAction
                ? OutlinedButton(onPressed: onPressed, child: Text(label))
                : ElevatedButton(onPressed: onPressed, child: Text(label)),
      ),
    );
  }
}
