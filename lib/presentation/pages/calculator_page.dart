import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_calculator_app/presentation/widgets/calculator_display.dart';
import 'package:simple_calculator_app/presentation/widgets/calculator_keyboard.dart';
import '../bloc/calculator_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          // Display area using a flexible ratio
          BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              String display = '';
              if (state is InitialState) {
                display = state.result;
              } else if (state is UpdateState) {
                display = state.display;
              } else if (state is ResultState) {
                display = state.result;
              }
              return CalculatorDisplay(displayText: display);
            },
          ),
          CalculatorKeyboar()
        ],
      ),
    );
  }
}
