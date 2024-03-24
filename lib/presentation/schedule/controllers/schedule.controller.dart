import 'package:get/get.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';

import '../../home/controllers/home.controller.dart';

class ScheduleController extends GetxController {
  final HomeController home = Get.find<HomeController>();

  var tripIDs = [(-1).obs, (-1).obs];
  Rxn<String> newReturnDate = Rxn(null);

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

  void onDetailChangeTapped() {
    if (Get.currentRoute == "/schedule_return") return Get.close(2);
    Get.close(1);
  }

  Future<void> onReloadTapped(int screenIndex) async {
    home.scheduleLoadings[screenIndex].value = true;
    var route = screenIndex == 1
        ? [
            home.selectedLocations[1].value!,
            home.selectedLocations[0].value!,
          ]
        : [
            home.selectedLocations[0].value!,
            home.selectedLocations[1].value!,
          ];
    await home.network.getAllSelectedTripData(route).then((trips) async {
      if (screenIndex == 1) {
        home.network.listReturnTrip.assignAll(trips);
        await _filterReturnList();
      } else {
        home.network.listTrip.assignAll(trips);
      }
      home.scheduleLoadings[screenIndex].value = false;
    });
  }

  Future<DateTime> _checkNewReturnDepartureTime() async {
    var start = "${home.network.listTrip[tripIDs[0].value].departure}";
    var end = "${home.network.listTrip[tripIDs[0].value].arrival}";
    var tripTime = "$start-$end";
    var tripLengthHour = tripTime.tripLengthDur(0, home.locale);
    var tripLengthMin = tripTime.tripLengthDur(1, home.locale);
    var arrivalTime = home.network.listTrip[tripIDs[0].value].departure!
        .tripTimeDateFormat(locale: home.locale)
        .add(Duration(hours: tripLengthHour, minutes: tripLengthMin));
    var now = DateTime.now().toLocal();
    return DateTime(
      now.year,
      now.month,
      now.day,
      arrivalTime.hour,
      arrivalTime.minute,
    );
  }

  Future<void> _filterReturnList() async {
    if (home.selectedDates[0].value != home.selectedDates[1].value) {
      home.scheduleLoadings[1].value = false;
      return;
    }
    var newReturnTime = await _checkNewReturnDepartureTime();
    var subsIndex = -1;
    var now = DateTime.now().toLocal();
    for (int i = 0; i < home.network.listReturnTrip.length; i++) {
      var departure =
          home.network.listReturnTrip[i].departure!.tripTimeDateFormat(
        locale: home.locale,
      );
      var newDepartureTime = DateTime(
        now.year,
        now.month,
        now.day,
        departure.hour,
        departure.minute,
      );
      if (newDepartureTime.isBefore(newReturnTime)) {
        subsIndex = i;
      }
    }
    var subReturnList = home.network.listReturnTrip.sublist(subsIndex + 1);
    home.network.listReturnTrip.assignAll(subReturnList);
    if (home.network.listReturnTrip.isNotEmpty) {
      home.scheduleLoadings[1].value = false;
      return;
    }
    newReturnDate.value = home.selectedDates[0].value;
    var newReturn = home.selectedDates[1].value
        .pickerDateFormat(home.locale)
        .add(const Duration(days: 1));
    newReturnDate.value = newReturn.pickerStringFormat(home.locale);
    var route = [
      home.selectedLocations[1].value!,
      home.selectedLocations[0].value!,
    ];
    await home.network.getAllSelectedTripData(route).then((trips) {
      home.network.listReturnTrip.assignAll(trips);
      home.scheduleLoadings[1].value = false;
    });
  }

  Future<void> onOriginScheduleTap(int index) async {
    tripIDs[0].value = index;
    if (home.roundTrip.value) {
      newReturnDate.value = null;
      Get.toNamed("/schedule_return");
      home.scheduleLoadings[1].value = true;
      var route = [
        home.selectedLocations[1].value!,
        home.selectedLocations[0].value!,
      ];
      await home.network.getAllSelectedTripData(route).then((trips) async {
        home.network.listReturnTrip.assignAll(trips);
        await _filterReturnList();
      });
      return;
    }
    await Get.toNamed("/payment");
  }

  Future<void> onReturnScheduleTap(int index) async {
    tripIDs[1].value = index;
    await Get.toNamed("/payment");
  }
}
