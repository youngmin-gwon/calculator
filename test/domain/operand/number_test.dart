import 'package:calculator/domain/exceptions/invalid_number_format_exception.dart';
import 'package:calculator/domain/operand/number.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Number:',
    () {
      test(
        'integer 포맷을 넣었을 때, int 를 반환해야 합니다.',
        () async {
          // arrange
          final number = Number('1');

          // act
          final result = number.calculate();

          // assertion
          expect(result, isA<int>());
          expect(result, 1);
        },
      );

      test(
        'double 포맷을 넣었을 때, double 를 반환해야 합니다.',
        () async {
          // arrange
          final number = Number('1.');

          // act
          final result = number.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result, 1.0);
        },
      );

      test(
        '잘못된 숫자 포맷을 넣었을 때, `InvalidNumberFormatException` 을 던져야 합니다.',
        () async {
          // arrange
          final number = Number('hello, world');

          // act
          final result = number.calculate;

          // assertion
          expect(() => result.call(),
              throwsA(isA<InvalidNumberFormatException>()));
        },
      );
    },
  );
}
