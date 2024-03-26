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

extension TripLengthFormatter on String {
  DateTime get _now => DateTime.now().toLocal();

  List<String> get _splitTripTime => split("-");

  DateTime tripTimeDateFormat({String? date, String? locale}) =>
      DateFormat("HH:mm", locale).parse(date ?? this);

  DateTime _startTripTime([String? locale]) =>
      tripTimeDateFormat(date: _splitTripTime[0], locale: locale);

  DateTime _endTripTime([String? locale]) =>
      tripTimeDateFormat(date: _splitTripTime[1], locale: locale);

  Duration _tripLengthDif([String? locale]) =>
      _endTripTime(locale).difference(_startTripTime(locale));

  int tripLengthDur(int index, [String? locale]) =>
      int.parse(_tripLengthDif(locale).toString().split(":")[index]);

  String _tripLength([String? locale]) => DateFormat("h:mm").format(
        DateTime(
          _now.year,
          _now.month,
          _now.day,
          tripLengthDur(0, locale),
          tripLengthDur(1, locale),
        ),
      );

  List<String> _splitTripLength([String? locale]) =>
      _tripLength(locale).split(":");

  String claculateTripLength([String? locale]) {
    if (locale == "id") {
      return "${_splitTripLength(locale)[0]}j ${_splitTripLength(locale)[1]}mnt";
    }
    return "${_splitTripLength(locale)[0]}h ${_splitTripLength(locale)[1]}mnt";
  }
}

extension TripSeatsAvailability on List<String> {
  bool get checkTripSeatAvailability {
    if (any((seat) => seat == "available")) return true;
    return false;
  }

  int get checkTripSeatNumber {
    var availableSeat = 0;
    for (var seat in this) {
      if (seat == "available") {
        availableSeat += 1;
      }
    }
    return availableSeat;
  }
}

extension TripPassengerFormatter on String {
  int get tripPassengerFormat => int.parse(split(" ")[0]);
}

extension GenerateTicketID on List<String> {
  String generateTicketID({
    required int uid,
    required int tid,
    required List<int> seats,
    required String date,
    required String departure,
  }) {
    var routeCode = "${this[0][0].capitalize}${this[1][0].capitalize}";
    seats.sort((a, b) => a.compareTo(b));
    var seat = "";
    for (var s in seats) {
      if (s != -1) {
        seat += "$s/";
      }
    }
    var dateToDateTime = date.pickerDateFormat(Get.locale!.languageCode);
    var departureToDateTime = departure.tripTimeDateFormat(
      locale: Get.locale!.languageCode,
    );
    var dateTimeCombine = DateTime(
      dateToDateTime.year,
      dateToDateTime.month,
      dateToDateTime.day,
      departureToDateTime.hour,
      departureToDateTime.minute,
    );
    var dateMilliEpoch = dateTimeCombine.millisecondsSinceEpoch;
    return "$routeCode-$uid/$tid/$seat$dateMilliEpoch";
  }
}
