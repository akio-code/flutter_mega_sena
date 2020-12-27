import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final numberFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  static String convert(double value) => numberFormat.format(value);
}
