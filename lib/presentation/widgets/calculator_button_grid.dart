import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc.dart';

class CalculatorButton extends StatelessWidget {
  final String label;

  const CalculatorButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a base font size and scale it with screen width
    double fontSize = screenWidth * 0.06; // Adjust the multiplier as needed

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // Ensures the button is circular
        child: Container(
          margin: const EdgeInsets.all(8), // Optional: Add margin for spacing
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45), // Rounded corners
              ),
            ),
            onPressed: () {
              if (label == 'C') {
                context.read<CalculatorBloc>().add(ClearAllEvent());
              } else if (label == '⌫') {
                context.read<CalculatorBloc>().add(BackSpaceEvent());
              } else if (label == '=') {
                context.read<CalculatorBloc>().add(EqualOperation());
              } else if (label == '%') {
                context.read<CalculatorBloc>().add(PercentageEvent());
              } else {
                context.read<CalculatorBloc>().add(AppendCharacterEvent(label));
              }
            },
            child: Text(
              label,
              style: TextStyle(
                fontSize:
                    fontSize, // Set dynamic font size based on screen width
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
