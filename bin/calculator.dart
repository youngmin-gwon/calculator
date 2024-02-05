import 'package:calculator/calculator.dart' as calculator;

void main(List<String> arguments) {
  final joinedArguments = arguments.join('');
  calculator.calculate(joinedArguments);
}
