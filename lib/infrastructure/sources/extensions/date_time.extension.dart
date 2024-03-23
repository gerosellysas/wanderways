import 'package:intl/intl.dart';

extension PickerStringFormatter on DateTime {
  String pickerStringFormat([String? locale]) =>
      DateFormat("EEE, dd MMM yyyy", locale).format(this);
}
