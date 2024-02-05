import 'package:calculator/domain/exceptions/invalid_number_format_exception.dart';
import 'package:calculator/domain/expression.dart';

final class Number implements Expression {
  const Number(this._rawNumber);

  final String _rawNumber;

  @override
  num calculate() {
    final regex = RegExp(r'[0-9]+[.]?[0-9]*');
    if (!regex.hasMatch(_rawNumber)) {
      throw InvalidNumberFormatException();
    }
    return num.parse(_rawNumber);
  }
}
