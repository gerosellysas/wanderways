import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';
import 'widgets/home.widgets.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.25;
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => HomeView(
            languageSelected: c.storage.language.value,
            returnFieldAnimation: c.returnFieldAnimation,
            roundTrip: c.roundTrip.value,
            locationEmpties: [
              c.locationEmpties[0].value,
              c.locationEmpties[1].value,
            ],
            departureLocation: Obx(() => HomeDropDown(
                  hint: c.storage.language.value == 0
                      ? "Lokasi keberangkatan"
                      : "Departure location",
                  items: c.locations,
                  selected: c.selectedLocations[0].value,
                  onChanged: (location) => c.onLocationChanged(location, 0),
                )),
            arrivalLocation: Obx(() => HomeDropDown(
                  hint:
                      c.storage.language.value == 0 ? "Tujuan" : "Destination",
                  items: c.locations,
                  selected: c.selectedLocations[1].value,
                  onChanged: (location) => c.onLocationChanged(location, 1),
                )),
            departureDate: Obx(() => HomeDate(
                  hint: c.selectedDates[0].value,
                )),
            returnDate: Obx(() => HomeDate(
                  hint: c.selectedDates[1].value,
                )),
            seat: Obx(() => HomeDropDown(
                  items: c.storage.language.value == 0 ? c.seatsID : c.seatsEN,
                  selected: c.selectedSeat.value,
                  itemsOffset: c.roundTrip.value &&
                          (c.locationEmpties.any((e) => e.value == true))
                      ? Offset(-12.w, 175.5.h)
                      : null,
                  onChanged: c.onSeatChanged,
                )),
            onDepartureDateTap: () => c.openDatePicker(0),
            onReturnDateTap: () => c.openDatePicker(1),
            swapButton: HomeSwapButton(
              onTap: c.onLocationSwapped,
            ),
            switchButton: Obx(() => HomeSwitchButton(
                  languageSelected: c.storage.language.value,
                  locationEmpties: [
                    c.locationEmpties[0].value,
                    c.locationEmpties[1].value,
                  ],
                  enableRoundTrip: c.roundTrip.value,
                  onRoundTripChanged: c.onRoundTripChanged,
                )),
            onSearchTap: c.onSearchTapped,
          ),
        );
      },
    );
  }
}
