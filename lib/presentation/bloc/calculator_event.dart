part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class AppendCharacterEvent extends CalculatorEvent {
  final String character;

  AppendCharacterEvent(this.character);
}

class PercentageEvent extends CalculatorEvent {}

class ClearAllEvent extends CalculatorEvent {}

class BackSpaceEvent extends CalculatorEvent {}

class EqualOperation extends CalculatorEvent {}
