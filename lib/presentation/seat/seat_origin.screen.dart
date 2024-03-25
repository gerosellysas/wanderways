import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/seat.controller.dart';
import 'widgets/seat.widgets.dart';

class SeatOriginScreen extends GetView<SeatController> {
  const SeatOriginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => SeatView(
            languageSelected: c.schedule.home.storage.language.value,
            onBackTap: () => Get.back(),
            onContinueTap: () => c.onContinueTapped(0),
            passenger: Obx(() => SeatPassenger(
                  languageSelected: c.schedule.home.storage.language.value,
                  route: [
                    c.schedule.home.selectedLocations[0].value!,
                    c.schedule.home.selectedLocations[1].value!,
                  ],
                  date: c.schedule.home.selectedDates[0].value,
                  passenger: c.passenger.value,
                  seatsNo: c.originSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.originActivePassengers.map((a) => a.value).toList(),
                  onTap: c.onOriginPassengerTapped,
                )),
            selection: Obx(() => SeatSelector(
                  languageSelected: c.schedule.home.storage.language.value,
                  seats: c.originSeats.map((s) => s.value).toList(),
                  seatsNo: c.originSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.originActivePassengers.map((a) => a.value).toList(),
                  onSelect: c.onOriginSeatSelected,
                )),
          ),
        );
      },
    );
  }
}
