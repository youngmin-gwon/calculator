import 'package:calculator/application/calculation_parser.dart';
import 'package:calculator/application/exceptions/invalid_operation_format_exception.dart';
import 'package:calculator/domain/exceptions/divide_by_zero_exception.dart';
import 'package:calculator/domain/exceptions/invalid_number_format_exception.dart';

void calculate(String arguments) {
  try {
    final parser = CalculationParser(arguments);
    final calculation = parser.parse();
    print(calculation.calculate());
  } on InvalidOperationFormatException {
    print('Invalid Operation format: $arguments');
  } on InvalidNumberFormatException {
    print('Invalid Number format: $arguments');
  } on DivideByZeroException {
    print('Divide by Zero Error: $arguments');
  }
}
