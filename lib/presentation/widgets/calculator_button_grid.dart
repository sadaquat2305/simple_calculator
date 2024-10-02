import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc.dart';

class CalculatorButton extends StatelessWidget {
  final String label;

  const CalculatorButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio:
            1, // Ensures the button is circular by keeping width and height equal
        child: Container(
          margin: const EdgeInsets.all(
              8), // Optional: Add margin for spacing between buttons
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12)) // Use CircleBorder for circular shape
                ),
            onPressed: () {
              if (label == 'C') {
                context.read<CalculatorBloc>().add(ClearAllEvent());
              } else if (label == '⌫') {
                context.read<CalculatorBloc>().add(BackSpaceEvent());
              } else if (label == '=') {
                context.read<CalculatorBloc>().add(EqualOperation());
              } else {
                context.read<CalculatorBloc>().add(AppendCharacterEvent(label));
              }
            },
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
