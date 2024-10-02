import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_calculator_app/presentation/widgets/calculator_display.dart';
import 'package:simple_calculator_app/presentation/widgets/calculator_keyboard.dart';
import '../bloc/calculator_bloc.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
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
