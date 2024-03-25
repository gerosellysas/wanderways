import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../../home/controllers/home.controller.dart';
import '../../schedule/controllers/schedule.controller.dart';
import '../../seat/controllers/seat.controller.dart';

class PaymentController extends GetxController {
  final SeatController seat = Get.find<SeatController>();
  ScheduleController get schedule => seat.schedule;
  HomeController get home => schedule.home;
  StorageService get storage => home.storage;
  NetworkService get network => home.network;

  var paid = false.obs;

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  void onPaidChanged(bool? isPaid) {
    paid.value = isPaid!;
  }
}
