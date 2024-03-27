import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/booking.controller.dart';
import 'widgets/booking.widgets.dart';

class BookingStatusScreen extends GetView<BookingController> {
  const BookingStatusScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return PopScope(
          canPop: false,
          onPopInvoked: c.onBookingStatusBackTapped,
          child: Obx(
            () => BookingStatusView(
              languageSelected: c.storage.language.value,
              bookingId: c.storage.purchase.value.bookingId,
              onBackTap: () => c.onBookingStatusBackTapped(false),
              detail: Obx(() => BookingStatusDetail(
                    languageSelected: c.storage.language.value,
                    locale: c.locale,
                    purchase: c.storage.purchase.value,
                    trips: [
                      c.network.trip.value,
                      c.network.returnTrip.value,
                    ],
                    onPayTap: () => c.onPayBookingTapped(),
                    onCancelTap: () => c.onCancelBookingTapped(),
                  )),
            ),
          ),
        );
      },
    );
  }
}
