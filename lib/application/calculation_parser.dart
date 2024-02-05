import 'package:calculator/application/calculation.dart';
import 'package:calculator/application/exceptions/invalid_operation_format_exception.dart';

/// input을 읽고 어떤 계산을 해야할지 할당하는 클래스
class CalculationParser {
  CalculationParser(String expression) : _rawExpression = expression;

  final String _rawExpression;

  /// 한계
  ///
  /// 복잡한 연산을 하기 위해서는 Token으로 만들어 RPN
  /// (Reverse Polish Notation)으로 변환해 interpreter 패턴을 만들어야 하는 것을
  /// 공부했던 자료를 통해 알게 됨.
  ///
  /// 하지만,
  ///
  /// 1. 현재는 어떻게 구현 하는지 모르고,
  /// 2. 모르는 것을 어딘가에 가져와서 아는 것처럼 작성하는 것은 부끄럽게 생각해,
  ///
  /// 요구사항(Operand Operation Operand) 에 만족할만큼만 간단하게 구현함
  // TODO: 제대로된 parsing 적용하기
  Calculation parse() {
    final rawTokens = _rawExpression.trim().split(' ');

    if (rawTokens.length != 3) {
      throw InvalidOperationFormatException();
    }

    return Calculation.basic(tokens: rawTokens);
  }
}
