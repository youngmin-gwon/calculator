import 'package:calculator/application/calculation.dart';
import 'package:calculator/application/calculation_parser.dart';
import 'package:calculator/application/exceptions/invalid_operation_format_exception.dart';
import 'package:test/test.dart';

void main() {
  group(
    'CalculationParser:',
    () {
      test(
        '3개의 단어로 구성된 문자열 식을 `Calculation` 으로 잘 할당하여야 합니다.',
        () async {
          // arrange
          final parser = CalculationParser('2 - 2');

          // act
          final result = parser.parse();

          // assert
          expect(result, isA<Calculation>());
        },
      );

      test(
        '3개의 단어로 구성되지 않은 문자열 식은 `InvalidOperationFormatException` 을 던져야합니다.',
        () async {
          // arrange
          final parser = CalculationParser('sin 45');

          // act
          final result = parser.parse;

          // assert
          expect(() => result.call(),
              throwsA(isA<InvalidOperationFormatException>()));
        },
      );
    },
  );
}
