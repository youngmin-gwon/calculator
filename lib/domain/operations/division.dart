import 'package:calculator/domain/exceptions/divide_by_zero_exception.dart';
import 'package:calculator/domain/expression.dart';

class Division implements Expression {
  const Division({
    required Expression left,
    required Expression right,
  })  : _left = left,
        _right = right;

  final Expression _left;
  final Expression _right;

  @override
  num calculate() {
    if (_right.calculate() == 0) {
      throw DivideByZeroException();
    }
    return _left.calculate() / _right.calculate();
  }
}
