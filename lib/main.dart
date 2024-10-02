import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calculator_app/domain/calculator_expression.dart';
import 'presentation/pages/calculator_page.dart';
import 'presentation/bloc/calculator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: BlocProvider(
        create: (_) => CalculatorBloc(CalculatorExpresson()),
        child: CalculatorPage(),
      ),
    );
  }
}
