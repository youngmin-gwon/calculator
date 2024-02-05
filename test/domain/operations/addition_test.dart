import 'package:calculator/domain/operand/number.dart';
import 'package:calculator/domain/operations/addition.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Addition:',
    () {
      test(
        'integer 덧셈은 integer를 반환 해야합니다.',
        () async {
          // arrange
          final leftOperand = Number('1');
          final rightOperand = Number('2');
          final addition = Addition(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<int>());
          expect(result, 3);
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 덧셈은 double을 반환 해야합니다.(소수점 첫째자리)',
        () async {
          // arrange
          final leftOperand = Number('1.');
          final rightOperand = Number('1.1');
          final addition = Addition(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(1), (2.1).toStringAsFixed(1));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 덧셈은 double을 반환 해야합니다.(소수점 둘째자리)',
        () async {
          // arrange
          final leftOperand = Number('1.50');
          final rightOperand = Number('2.50');
          final addition = Addition(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(2), (4.00).toStringAsFixed(2));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'double 덧셈은 double을 반환 해야합니다.(소수점 셋째자리)',
        () async {
          // arrange
          final leftOperand = Number('1.111');
          final rightOperand = Number('2.222');
          final addition = Addition(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(3), (3.333).toStringAsFixed(3));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단하기 때문에 이를 String으로 변환하여 테스트함
      test(
        'int 와 double 덧셈은 double을 반환 해야합니다.',
        () async {
          // arrange
          final leftOperand = Number('1');
          final rightOperand = Number('2.3456');
          final addition = Addition(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(4), (3.3456).toStringAsFixed(4));
        },
      );
    },
  );
}
