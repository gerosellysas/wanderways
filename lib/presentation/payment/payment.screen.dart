import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/payment.controller.dart';
import 'widgets/payment.widgets.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => PaymentView(
            onBackTap: () => Get.back(),
            languageSelected: c.storage.language.value,
            detail: Obx(() => PaymentDetail(
                  languageSelected: c.storage.language.value,
                  locale: c.home.locale,
                  user: c.storage.user.value,
                  roundTrip: c.home.roundTrip.value,
                  bookingID: c.seat.bookingID.value,
                  route: [
                    c.home.selectedLocations[0].value!,
                    c.home.selectedLocations[1].value!,
                  ],
                  dates: [
                    c.home.selectedDates[0].value,
                    c.seat.schedule.newReturnDate.value ??
                        c.home.selectedDates[1].value
                  ],
                  schedule: [
                    c.network.trip.value.departure!,
                    c.network.trip.value.arrival!,
                    c.network.returnTrip.value.departure ?? "",
                    c.network.returnTrip.value.arrival ?? "",
                  ],
                  passenger: c.seat.passenger.value.toString(),
                  seats: [
                    c.seat.originSeatNumbers.map((n) => n.value).toList(),
                    c.seat.returnSeatNumbers.map((n) => n.value).toList(),
                  ],
                  prices: [
                    c.network.trip.value.price ?? 0,
                    c.network.returnTrip.value.price ?? 0,
                  ],
                  paid: c.paid.value,
                  onPaidChange: c.onPaidChanged,
                )),
          ),
        );
      },
    );
  }
}
