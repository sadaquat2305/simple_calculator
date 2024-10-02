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

      // Prevent consecutive operators
      if (operators.contains(event.character)) {
        if (operators.contains(lastChar)) {
          return; // Prevent adding consecutive operators
        }
      }

      // Prevent multiple decimal points in a number
      if (event.character == '.') {
        // Check if there's already a decimal point in the current number
        String lastNumber =
            _exp.split(RegExp(r'[\+\-\*/]')).last; // Split by operators
        if (lastNumber.contains('.')) {
          return; // Prevent adding another decimal point
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
