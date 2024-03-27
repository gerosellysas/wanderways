import 'package:get/get.dart';

import '../../../../presentation/booking/controllers/booking.controller.dart';

class BookingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
  }
}
