import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../overlays/home.overlays.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final StorageService storage = Get.find<StorageService>();

  final now = DateTime.now();
  final locations = ["Semarang", "Solo", "Yogyakarta"];
  final seatsID = ["1 kursi", "2 kursi", "3 kursi"];
  final seatsEN = ["1 seat", "2 seats", "3 seats"];

  late AnimationController returnFieldAnimation;

  String get locale => Get.locale!.languageCode;

  var selectedLocations = <Rxn<String?>>[];
  var locationEmpties = <RxBool>[];
  var selectedDates = <RxString>[];
  var pickerDates = <Rxn<DateTime>>[];
  var selectedSeat = "".obs;
  var roundTrip = false.obs;

  var _pickerTapped = 0;

  @override
  void onInit() {
    selectedSeat.value = storage.language.value == 0 ? "1 kursi" : "1 seat";
    for (var i = 0; i < 2; i++) {
      selectedLocations.add(Rxn(null));
      locationEmpties.add(false.obs);
      selectedDates.add(
        DateTime.now().toLocal().pickerStringFormat(locale).obs,
      );
      pickerDates.add(Rxn(null));
    }
    returnFieldAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      reverseDuration: const Duration(milliseconds: 150),
    );
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    returnFieldAnimation.dispose();
    super.onClose();
  }

  void onLocationChanged(String? location, int index) {
    switch (index) {
      case 1:
        if (selectedLocations[0].value == location) return;
      default:
        if (selectedLocations[1].value == location) return;
    }
    locationEmpties[index].value = false;
    selectedLocations[index].value = location;
  }

  void onLocationSwapped() {
    var isNull = selectedLocations[0].value == null &&
        selectedLocations[1].value == null;
    if (isNull) return;
    var departure = selectedLocations[0].value;
    var arrival = selectedLocations[1].value;
    selectedLocations[0].value = arrival;
    selectedLocations[1].value = departure;
  }

  void onRoundTripChanged(bool enable) {
    roundTrip.value = enable;
    if (pickerDates[1].value == null ||
        pickerDates[0].value!.isAfter(pickerDates[1].value!)) {
      selectedDates[1].value = selectedDates[0].value;
    }
    if (returnFieldAnimation.status == AnimationStatus.dismissed) {
      returnFieldAnimation.forward();
    } else {
      returnFieldAnimation.reverse();
    }
  }

  Future<void> openDatePicker(int index) async {
    _pickerTapped = 0;

    if (!roundTrip.value || index == 0) {
      pickerDates.assignAll([Rxn(null), Rxn(null)]);
    } else {
      pickerDates.assignAll(
          [Rxn(selectedDates[0].value.pickerDateFormat(locale)), Rxn(null)]);
    }

    await Get.to(
      () => Obx(() => HomeDatePicker(
            languageSelected: storage.language.value,
            roundTrip: roundTrip.value,
            locale: locale,
            departureDate: pickerDates[0].value,
            returnDate: pickerDates[1].value,
            onSelectionChange: (datePickerArgs) => onDatePickerSelectionChanged(
              datePickerArgs,
              index,
            ),
            onAddReturnTap: () {
              roundTrip.value = true;
              returnFieldAnimation.forward();
            },
          )),
      routeName: "/home_date_picker",
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 250),
    );
  }

  void onDatePickerSelectionChanged(
    DateRangePickerSelectionChangedArgs datePickerArgs,
    int index,
  ) {
    switch (roundTrip.value) {
      case false:
        pickerDates[0].value = datePickerArgs.value;
        var oldStartDate = selectedDates[0].value.pickerDateFormat(locale);
        var noChange = pickerDates[0].value == null ||
            pickerDates[0].value == oldStartDate;
        if (noChange) return;
        selectedDates[0].value =
            pickerDates[0].value!.pickerStringFormat(locale);
        Future.delayed(const Duration(milliseconds: 250), () => Get.back());
        return;
      default:
        _pickerTapped++;
        var res = datePickerArgs.value;
        pickerDates[0].value = res.startDate;
        pickerDates[1].value = res.endDate;
        if (index == 1) return _onDatePickerRangeReturnTapped();
        _onDatePickerRangeDepartureTapped();
    }
  }

  void _onDatePickerRangeDepartureTapped() {
    if (_pickerTapped == 2) return _onDatePickerRangeReturnTapped();
  }

  void _onDatePickerRangeReturnTapped() {
    selectedDates[0].value = pickerDates[0].value!.pickerStringFormat(locale);
    selectedDates[1].value = pickerDates[1].value!.pickerStringFormat(locale);
    Future.delayed(const Duration(milliseconds: 250), () => Get.back());
  }

  void onSeatChanged(String? seat) {
    selectedSeat.value = seat!;
  }

  void onSearchTapped() async {
    if (selectedLocations[0].value == null) locationEmpties[0].value = true;
    if (selectedLocations[1].value == null) locationEmpties[1].value = true;
    if (locationEmpties.any((empty) => empty.value == true)) return;
    // todo: go to schedule screen
  }
}
