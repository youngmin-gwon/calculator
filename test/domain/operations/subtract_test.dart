import 'package:calculator/domain/operand/number.dart';
import 'package:calculator/domain/operations/subtract.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Subtract',
    () {
      test(
        'integer 뺄셈은 integer를 반환 해야합니다.',
        () async {
          // arrange
          final leftOperand = Number('1');
          final rightOperand = Number('2');
          final addition = Subtract(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<int>());
          expect(result, -1);
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 뺄셈은 double을 반환 해야합니다.(소수점 첫째자리)',
        () async {
          // arrange
          final leftOperand = Number('2.');
          final rightOperand = Number('2.0');
          final addition = Subtract(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(1), (0.0).toStringAsFixed(1));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 뺄셈은 double을 반환 해야합니다.(소수점 둘째자리)',
        () async {
          // arrange
          final leftOperand = Number('5.00');
          final rightOperand = Number('2.50');
          final addition = Subtract(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(2), (2.50).toStringAsFixed(2));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 뺄셈은 double을 반환 해야합니다.(소수점 셋째자리)',
        () async {
          // arrange
          final leftOperand = Number('1.234');
          final rightOperand = Number('0.233');
          final addition = Subtract(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(3), (1.001).toStringAsFixed(3));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'int 와 double 뺄셈은 double을 반환 해야합니다.',
        () async {
          // arrange
          final leftOperand = Number('2');
          final rightOperand = Number('0.0001');
          final addition = Subtract(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(4), (1.9999).toStringAsFixed(4));
        },
      );
    },
  );
}