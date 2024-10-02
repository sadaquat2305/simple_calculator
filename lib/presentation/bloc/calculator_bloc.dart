import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_calculator_app/domain/calculator_expression.dart';
import 'package:simple_calculator_app/domain/expresson_entity.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorExpresson usecase;

  String _exp = '';
  final List<String> operators = ['+', '-', '*', '/'];

  CalculatorBloc(this.usecase) : super(InitialState('0')) {
    on<AppendCharacterEvent>((event, emit) {
      final lastChar = _exp.isNotEmpty ? _exp[_exp.length - 1] : '';

      // Check if the entered character is an operator
      if (operators.contains(event.character)) {
        // If the last character is also an operator, don't append
        if (operators.contains(lastChar)) {
          return; // Prevent adding consecutive operators
        }
      }

      // Append the character if it's valid
      _exp += event.character;

      // Emit the updated state
      emit(UpdateState(display: _exp));
    });

    on<ClearAllEvent>((event, emit) {
      _exp = '';
      emit(InitialState(''));
    });

    on<BackSpaceEvent>((event, emit) {
      if (_exp.isNotEmpty) {
        _exp = _exp.substring(0, _exp.length - 1);
        emit(UpdateState(display: _exp));
      }
    });

    on<EqualOperation>((event, emit) {
      if (_exp == '') {
        emit(InitialState(''));
      } else {
        var result = usecase.calculateExp(ExpressionValue(exp: _exp));

        print('Result: $result');

        if (result.endsWith(".0")) {
          result = result.substring(0, result.length - 2);

          emit(ResultState(result: result));
          _exp = result;
        } else {
          print('Result: after $result');
          emit(ResultState(result: result));
          _exp = result;
        }

        if (result == 'Error') {
          _exp = '';
        }
      }
    });
  }
}
