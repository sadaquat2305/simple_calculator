import 'package:math_expressions/math_expressions.dart';
import 'package:simple_calculator_app/domain/expresson_entity.dart';

class CalculatorExpresson {
  String calculateExp(ExpressionValue expr) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expr.exp);

      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      String result = eval.toStringAsFixed(2);
      if (result.endsWith('.00')) {
        result = result.substring(0, result.length - 3);
      }

      return result;
    } catch (e) {
      return 'Error';
    }
  }
}
