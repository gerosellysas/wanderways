import 'package:get/get.dart';

import '../../../../presentation/seat/controllers/seat.controller.dart';

class SeatControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeatController>(
      () => SeatController(),
    );
  }
}
