import 'package:calculator/domain/expression.dart';

class Subtraction implements Expression {
  const Subtraction({
    required Expression left,
    required Expression right,
  })  : _left = left,
        _right = right;

  final Expression _left;
  final Expression _right;

  @override
  num calculate() {
    return _left.calculate() - _right.calculate();
  }
}
