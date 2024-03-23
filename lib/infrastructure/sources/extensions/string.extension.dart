import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension NameFormatter on String {
  String get nameFormatter {
    var split = this.split(" ");
    var capitalized = [];
    for (var s in split) {
      capitalized.add(s.capitalizeFirst);
    }
    var result = capitalized.join(" ");
    return result;
  }
}

extension PickerDateFormatter on String {
  DateTime pickerDateFormat([String? locale]) =>
      DateFormat("EEE, dd MMM yyyy", locale).parse(this);
}
