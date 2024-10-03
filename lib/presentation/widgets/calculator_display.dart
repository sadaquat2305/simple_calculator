import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String displayText;

  const CalculatorDisplay({
    Key? key,
    required this.displayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.black,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: FittedBox(
          fit: BoxFit.scaleDown, // Scale the text down if it's too large
          alignment: Alignment.centerRight, // Align the text to the right
          child: Text(
            displayText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48, // Initial font size (it will scale down if needed)
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
