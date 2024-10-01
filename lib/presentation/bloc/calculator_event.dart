part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

class AppendCharacterEvent extends CalculatorEvent {
  final String character;

  AppendCharacterEvent(this.character);
}

class ClearAllEvent extends CalculatorEvent {}

class BackSpaceEvent extends CalculatorEvent {}

class EqualOperation extends CalculatorEvent {}
