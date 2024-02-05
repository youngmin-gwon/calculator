import 'package:calculator/domain/exceptions/divide_by_zero_exception.dart';
import 'package:calculator/domain/operand/number.dart';
import 'package:calculator/domain/operations/divide.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Divide:',
    () {
      test(
        '0으로 나누는 나눗셈은 `DivideByZeroException` 을 던져야 합니다.',
        () async {
          // arrange
          final leftOperand = Number('1');
          final rightOperand = Number('0');
          final addition = Divide(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate;

          // assertion
          expect(() => result.call(), throwsA(isA<DivideByZeroException>()));
        },
      );

      test(
        '나눗셈은 올바른 연산결과를 반환해야합니다.',
        () async {
          // arrange
          final leftOperand = Number('1');
          final rightOperand = Number('2');
          final addition = Divide(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, 0.5);
        },
      );
    },
  );
}
