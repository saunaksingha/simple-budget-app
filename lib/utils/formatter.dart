import 'package:intl/intl.dart';

class Formatters {
  static final NumberFormat _numberFormatter = NumberFormat.decimalPattern();

  static String amount(num value) {
    return _numberFormatter.format(value);
  }

  static String capitalize(String value) {
    if (value.isEmpty) return value;

    return '${value[0].toUpperCase()}${value.substring(1)}';
  }
}
