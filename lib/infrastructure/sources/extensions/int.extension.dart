import 'package:intl/intl.dart';

extension TripPriceFormatter on int {
  NumberFormat _formatter([String? locale]) => NumberFormat("#,##0", locale);

  String priceFormatter([String? locale]) => _formatter(locale).format(this);

  int calculateTax() => (this * 0.1).toInt();
}
