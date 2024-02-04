import 'package:calculator/domain/expression.dart';

final class Number implements Expression {
  const Number(this._number);

  final num _number;

  @override
  num calculate() {
    return _number;
  }
}
