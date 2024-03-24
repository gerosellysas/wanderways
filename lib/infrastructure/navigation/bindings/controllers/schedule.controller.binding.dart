import 'package:get/get.dart';

import '../../../../presentation/schedule/controllers/schedule.controller.dart';

class ScheduleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
  }
}
