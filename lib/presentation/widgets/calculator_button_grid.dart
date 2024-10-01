import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc.dart';

class CalculatorButton extends StatelessWidget {
  final String text;

  const CalculatorButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == '=') {
          context.read<CalculatorBloc>().add(EqualOperation());
        } else if (text == 'C') {
          context.read<CalculatorBloc>().add(ClearAllEvent());
        } else if (text == '⌫') {
          context.read<CalculatorBloc>().add(BackSpaceEvent());
        } else {
          context.read<CalculatorBloc>().add(AppendCharacterEvent(text));
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(24), // Padding for button size
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
