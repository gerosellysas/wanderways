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
            languageSelected: c.storage.language.value,
            onBackTap: () => Get.back(),
            onContinueTap: () => c.onContinueTapped(1),
            passenger: Obx(() => SeatPassenger(
                  languageSelected: c.storage.language.value,
                  route: c.home.returnRoute,
                  date: c.schedule.newReturnDate.value ??
                      c.home.selectedDates[1].value,
                  passenger: c.passenger.value,
                  seatsNo: c.returnSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.returnActivePassengers.map((a) => a.value).toList(),
                  onTap: c.onReturnPassengerTapped,
                )),
            selection: Obx(() => SeatSelector(
                  languageSelected: c.storage.language.value,
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
