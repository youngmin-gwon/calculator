import 'package:calculator/application/exceptions/invalid_operation_format_exception.dart';
import 'package:calculator/domain/operand/number.dart';
import 'package:calculator/domain/operations/addition.dart';
import 'package:calculator/domain/operations/division.dart';
import 'package:calculator/domain/operations/multiplication.dart';
import 'package:calculator/domain/operations/subtraction.dart';

/// 계산을 담당하는 class 를 위한 interface
///
/// 바로 Expression 을 만들지 않고 이 [Calculation] 을 만든 이유?
///
/// - 이후 구현될 삼각함수 계산 같은 것들을 RPN 변환 코드가 완성되기 전까지
///   이 interface로 추가해서 구현/확장 할 수 있도록 하는 bumper 의 역할
abstract interface class Calculation {
  const factory Calculation.basic({required List<String> tokens}) =
      CalculationImplBasic;

  num calculate();
}

/// 간단한 사칙연산을 위한 [Calculation] 구현
class CalculationImplBasic implements Calculation {
  const CalculationImplBasic({required List<String> tokens}) : _tokens = tokens;

  final List<String> _tokens;

  @override
  num calculate() {
    final left = Number(_tokens[0]);
    final right = Number(_tokens[2]);
    final rawOperation = _tokens[1];

    final operation = switch (rawOperation) {
      '+' => Addition(left: left, right: right),
      '-' => Subtraction(left: left, right: right),
      '*' => Multiplication(left: left, right: right),
      '/' => Division(left: left, right: right),
      _ => throw InvalidOperationFormatException(),
    };

    return operation.calculate();
  }
}
