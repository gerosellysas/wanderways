import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/booking.controller.dart';
import 'widgets/booking.widgets.dart';

class BookingScreen extends GetView<BookingController> {
  const BookingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Obx(
          () => BookingView(
            languageSelected: c.storage.language.value,
            loading: c.loading.value,
            empty: c.storage.listPurchase.isEmpty,
            list: Obx(() => BookingList(
                  languageSelected: c.storage.language.value,
                  locale: c.locale,
                  listPurchase: c.storage.listPurchase,
                  listTrip: c.purchaseListTrip,
                  onDeleteTap: c.onBookingDeleteTapped,
                  onTap: c.onBookingCardTapped,
                )),
          ),
        );
      },
    );
  }
}
