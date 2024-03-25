import 'package:get/get.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';

import '../../schedule/controllers/schedule.controller.dart';

class SeatController extends GetxController {
  final ScheduleController schedule = Get.find<ScheduleController>();

  var passenger = 0.obs;
  var originSeats = <RxString>[];
  var originSeatNumbers = <RxInt>[];
  var originActivePassengers = <RxBool>[];
  var returnSeats = <RxString>[];
  var returnSeatNumbers = <RxInt>[];
  var returnActivePassengers = <RxBool>[];

  @override
  void onInit() {
    passenger.value = schedule.home.selectedSeat.value.tripPassengerFormat;
    originSeats = schedule
        .home.network.listTrip[schedule.tripIDs[0].value].seats!
        .map((e) => e.obs)
        .toList();
    for (var i = 0; i < passenger.value; i++) {
      originSeatNumbers.add((-1).obs);
      originActivePassengers.add(false.obs);
    }
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

  void onOriginPassengerTapped(int index) {
    if (originActivePassengers[index].value) {
      originActivePassengers[index].toggle();
      return;
    }
    originActivePassengers.map((a) => a.value = false).toList();
    originActivePassengers[index].value = true;
  }

  void onOriginSeatSelected(int index) {
    var passIndex = originActivePassengers.indexWhere((active) => active.value);
    originSeatNumbers[passIndex].value = index + 1;
  }

  void onReturnPassengerTapped(int index) {
    if (returnActivePassengers[index].value) {
      returnActivePassengers[index].toggle();
      return;
    }
    returnActivePassengers.map((a) => a.value = false).toList();
    returnActivePassengers[index].value = true;
  }

  void onReturnSeatSelected(int index) {
    var passIndex = returnActivePassengers.indexWhere((active) => active.value);
    returnSeatNumbers[passIndex].value = index + 1;
  }

  void _showSnackBar() {
    Get.rawSnackbar(
      message: schedule.home.storage.language.value == 0
          ? "Ada penumpang yang belum memilih tempat duduk"
          : "There are passengers who haven't chosen their seats",
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      duration: const Duration(milliseconds: 1500),
    );
  }

  Future<void> onContinueTapped(int screen) async {
    if (screen == 0) {
      if (originSeatNumbers.any((number) => number.value == -1)) {
        return _showSnackBar();
      }
      returnSeats = schedule
          .home.network.listTrip[schedule.tripIDs[1].value].seats!
          .map((e) => e.obs)
          .toList();
      if (returnSeatNumbers.isNotEmpty) returnSeatNumbers.clear();
      if (returnActivePassengers.isNotEmpty) returnActivePassengers.clear();
      for (var i = 0; i < passenger.value; i++) {
        returnSeatNumbers.add((-1).obs);
        returnActivePassengers.add(false.obs);
      }
      return await Get.toNamed("/seat_return");
    }
    if (returnSeatNumbers.any((number) => number.value == -1)) {
      return _showSnackBar();
    }
    await Get.toNamed("/payment");
  }
}
