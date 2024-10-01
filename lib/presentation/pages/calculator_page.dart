import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calculator_app/presentation/widgets/calculator_button_grid.dart';
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
              return Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(24),
                color: Colors.black87, // Background color for display
                child: Text(
                  display,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white, // Text color for display
                  ),
                ),
              );
            },
          ),

          _buildKeypad(context),
        ],
      ),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Column(
      children: [
        // Each row represents one line of buttons
        _buildButtonRow(context, ['(', ')', '⌫', 'C']),
        _buildButtonRow(context, ['7', '8', '9', '/']),
        _buildButtonRow(context, ['4', '5', '6', '*']),
        _buildButtonRow(context, ['1', '2', '3', '-']),
        _buildButtonRow(context, ['.', '0', '=', '+'])
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context, List<String> buttonTexts) {
    return Row(
      children:
          buttonTexts.map((text) => CalculatorButton(text: text)).toList(),
    );
  }
}
