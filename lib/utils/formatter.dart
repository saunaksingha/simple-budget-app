import 'package:intl/intl.dart';

class Formatters {
  static final NumberFormat _numberFormatter = NumberFormat.decimalPattern();

  static String amount(num value) {
    return _numberFormatter.format(value);
  }
}
