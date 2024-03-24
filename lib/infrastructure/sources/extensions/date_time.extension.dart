import 'package:intl/intl.dart';

extension PickerStringFormatter on DateTime {
  String pickerStringFormat([String? locale]) =>
      DateFormat("EEE, dd MMM yyyy", locale).format(this);
}

extension TripTimeFormmater on DateTime {
  String tripTimeStringFormat([String? locale]) =>
      DateFormat("HH:mm", locale).format(this);
}
