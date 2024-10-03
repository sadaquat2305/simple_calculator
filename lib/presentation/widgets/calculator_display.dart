import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String displayText;

  const CalculatorDisplay({
    Key? key,
    required this.displayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a base font size and scale it with screen width
    double fontSize = screenWidth * 0.1; // Adjust the multiplier as needed

    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: FittedBox(
          fit: BoxFit.scaleDown, // Scale the text down if it's too large
          alignment: Alignment.centerRight, // Align the text to the right
          child: Text(
            displayText,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize, // Dynamically set the font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
