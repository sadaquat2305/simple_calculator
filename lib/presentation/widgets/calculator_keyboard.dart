import 'package:flutter/material.dart';

import 'package:simple_calculator_app/presentation/widgets/calculator_button_grid.dart';

class CalculatorKeyboar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: const Row(
              children: [
                CalculatorButton(
                  label: '(',
                ),
                CalculatorButton(label: ')'),
                CalculatorButton(label: '⌫'),
                CalculatorButton(label: 'C')
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: const Row(
              children: [
                CalculatorButton(label: '7'),
                CalculatorButton(label: '8'),
                CalculatorButton(label: '9'),
                CalculatorButton(label: '/')
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: const Row(
              children: [
                CalculatorButton(label: '4'),
                CalculatorButton(label: '5'),
                CalculatorButton(label: '6'),
                CalculatorButton(label: '*')
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: const Row(
              children: [
                CalculatorButton(label: '1'),
                CalculatorButton(label: '2'),
                CalculatorButton(label: '3'),
                CalculatorButton(label: '-')
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: const Row(
              children: [
                CalculatorButton(label: '.'),
                CalculatorButton(label: '0'),
                CalculatorButton(label: '='),
                CalculatorButton(label: '+')
              ],
            ),
          )),
        ],
      ),
    );
  }
}
