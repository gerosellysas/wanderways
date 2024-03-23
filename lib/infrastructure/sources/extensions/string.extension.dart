import 'package:intl/intl.dart';

extension PickerDateFormatter on String {
  DateTime pickerDateFormat([String? locale]) =>
      DateFormat("EEE, dd MMM yyyy", locale).parse(this);
}
