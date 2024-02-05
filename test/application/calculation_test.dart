import 'package:calculator/application/calculation.dart';
import 'package:calculator/application/exceptions/invalid_operation_format_exception.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Calculation.',
    () {
      group(
        'basic:',
        () {
          test(
            '사칙 연산에 해당하지 않는 연산은 `InvalidOperationFormatException` 을 던져야합니다.',
            () async {
              // arrange
              final calculation = Calculation.basic(tokens: ['2', '^', '3']);

              // act
              final result = calculation.calculate;

              // assert
              expect(() => result.call(),
                  throwsA(isA<InvalidOperationFormatException>()));
            },
          );

          test(
            '사칙 연산 중 덧셈 계산을 수행해야합니다.',
            () async {
              // arrange
              final calculation = Calculation.basic(tokens: ['1', '+', '2']);

              // act
              final result = calculation.calculate();

              // assert
              expect(result, 3);
            },
          );

          test(
            '사칙 연산 중 뺄셈 계산을 수행해야합니다.',
            () async {
              // arrange
              final calculation = Calculation.basic(tokens: ['1', '-', '2']);

              // act
              final result = calculation.calculate();

              // assert
              expect(result, -1);
            },
          );

          test(
            '사칙 연산 중 곱셈 계산을 수행해야합니다.',
            () async {
              // arrange
              final calculation = Calculation.basic(tokens: ['1', '*', '2']);

              // act
              final result = calculation.calculate();

              // assert
              expect(result, 2);
            },
          );

          test(
            '사칙 연산 중 나눗셈 계산을 수행해야합니다.',
            () async {
              // arrange
              final calculation = Calculation.basic(tokens: ['1', '/', '2']);

              // act
              final result = calculation.calculate();

              // assert
              expect(result, 0.5);
            },
          );
        },
      );
    },
  );
}
