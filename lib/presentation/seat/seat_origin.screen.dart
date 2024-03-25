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
            languageSelected: c.storage.language.value,
            onBackTap: () => Get.back(),
            onContinueTap: () => c.onContinueTapped(0),
            passenger: Obx(() => SeatPassenger(
                  languageSelected: c.storage.language.value,
                  route: c.home.originRoute,
                  date: c.home.selectedDates[0].value,
                  passenger: c.passenger.value,
                  seatsNo: c.originSeatNumbers.map((n) => n.value).toList(),
                  activesPass:
                      c.originActivePassengers.map((a) => a.value).toList(),
                  onTap: c.onOriginPassengerTapped,
                )),
            selection: Obx(() => SeatSelector(
                  languageSelected: c.storage.language.value,
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
