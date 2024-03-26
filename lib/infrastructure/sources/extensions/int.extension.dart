import 'package:intl/intl.dart';

extension TripPriceFormatter on int {
  NumberFormat _formatter([String? locale]) => NumberFormat("#,##0", locale);

  String priceFormatter([String? locale]) => _formatter(locale).format(this);

  int calculateTax() => (this * 0.1).toInt();
}

extension SeatNumbersToString on List<int>? {
  String seatNumberToString() {
    this!.sort((a, b) => a.compareTo(b));
    switch (this!.length) {
      case 3:
        return "${this![0].toString()} - ${this![1].toString()} - ${this![2].toString()}";
      case 2:
        return "${this![0].toString()} - ${this![1].toString()}";
      case 1:
        return this![0].toString();
      default:
        return "";
    }
  }
}
