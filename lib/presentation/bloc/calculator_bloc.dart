import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_calculator_app/domain/calculator_expression.dart';
import 'package:simple_calculator_app/domain/expresson_entity.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculatorExpresson usecase;

  String _exp = '';

  CalculatorBloc(this.usecase) : super(InitialState('0')) {
    on<AppendCharacterEvent>((event, emit) {
      _exp += event.character;
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
      var result = usecase.calculateExp(ExpressionValue(exp: _exp));

      _exp = result;

      emit(ResultState(result: result));
    });
  }
}
