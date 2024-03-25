import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/seat.controller.dart';
import 'widgets/seat.widgets.dart';

class SeatReturnScreen extends GetView<SeatController> {
  const SeatReturnScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => SeatView(
            languageSelected: c.schedule.home.storage.language.value,
            onBackTap: () => Get.back(),
            onContinueTap: () => c.onContinueTapped(1),
            passenger: Obx(() => SeatPassenger(
                  languageSelected: c.schedule.home.storage.language.value,
                  route: [
                    c.schedule.home.selectedLocations[1].value!,
                    c.schedule.home.selectedLocations[0].value!,
                  ],
                  date: c.schedule.newReturnDate.value ??
                      c.schedule.home.selectedDates[1].value,
                  passenger: c.passenger.value,
                  seatsNo: c.returnSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.returnActivePassengers.map((a) => a.value).toList(),
                  onTap: c.onReturnPassengerTapped,
                )),
            selection: Obx(() => SeatSelector(
                  languageSelected: c.schedule.home.storage.language.value,
                  seats: c.returnSeats.map((s) => s.value).toList(),
                  seatsNo: c.returnSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.returnActivePassengers.map((a) => a.value).toList(),
                  onSelect: c.onReturnSeatSelected,
                )),
          ),
        );
      },
    );
  }
}
