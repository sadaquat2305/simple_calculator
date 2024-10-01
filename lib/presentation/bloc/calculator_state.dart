part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorState {}

final class InitialState extends CalculatorState {
  final String result;
  InitialState(this.result);
}

final class UpdateState extends CalculatorState {
  final String display;

  UpdateState({required this.display});
}

final class ResultState extends CalculatorState {
  final String result;

  ResultState({required this.result});
}
