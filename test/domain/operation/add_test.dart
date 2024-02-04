import 'package:calculator/domain/operand/number.dart';
import 'package:calculator/domain/operations/add.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Add',
    () {
      test(
        'should return valid integer result',
        () async {
          // arrange
          final leftOperand = Number(1);
          final rightOperand = Number(2);
          final addition = Add(
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
      // !      다르다고 판단되기 때문에 이를 String으로 변환하여 테스트함
      test(
        'should return valid double result within the first decimal place',
        () async {
          // arrange
          final leftOperand = Number(1.1);
          final rightOperand = Number(2.2);
          final addition = Add(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(1), 3.3.toStringAsFixed(1));
        },
      );

      // !NOTE: Computer가 floating-point 를 계산하는 방법 때문에, 단순 비교하면
      // !      다르다고 판단되기 때문에 이를 String으로 변환하여 테스트함
      test(
        'should return valid double result within the second decimal place',
        () async {
          // arrange
          final leftOperand = Number(1.19);
          final rightOperand = Number(2.81);
          final addition = Add(
            left: leftOperand,
            right: rightOperand,
          );

          // act
          final result = addition.calculate();

          // assertion
          expect(result, isA<double>());
          expect(result.toStringAsFixed(2), 4.0.toStringAsFixed(2));
        },
      );
    },
  );
}
