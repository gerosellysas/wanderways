import 'package:get/get.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../../home/controllers/home.controller.dart';

class ScheduleController extends GetxController {
  final HomeController home = Get.find<HomeController>();
  StorageService get storage => home.storage;
  NetworkService get network => home.network;

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
    var route = screenIndex == 1 ? home.returnRoute : home.originRoute;
    await network.getAllSelectedTripData(route).then((trips) async {
      if (screenIndex == 1) {
        network.listReturnTrip.assignAll(trips);
        await _filterReturnList();
      } else {
        network.listTrip.assignAll(trips);
      }
      home.scheduleLoadings[screenIndex].value = false;
    });
  }

  Future<DateTime> _checkNewReturnDepartureTime() async {
    var originIndex =
        network.listTrip.indexWhere((t) => t.id == network.trip.value.id);
    var start = "${network.listTrip[originIndex].departure}";
    var end = "${network.listTrip[originIndex].arrival}";
    var tripTime = "$start-$end";
    var tripLengthHour = tripTime.tripLengthDur(0, home.locale);
    var tripLengthMin = tripTime.tripLengthDur(1, home.locale);
    var arrivalTime = network.listTrip[originIndex].departure!
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
    for (int i = 0; i < network.listReturnTrip.length; i++) {
      var departure = network.listReturnTrip[i].departure!.tripTimeDateFormat(
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
    var subReturnList = network.listReturnTrip.sublist(subsIndex + 1);
    network.listReturnTrip.assignAll(subReturnList);
    if (network.listReturnTrip.isNotEmpty) {
      home.scheduleLoadings[1].value = false;
      return;
    }
    newReturnDate.value = home.selectedDates[0].value;
    var newReturn = home.selectedDates[1].value
        .pickerDateFormat(home.locale)
        .add(const Duration(days: 1));
    newReturnDate.value = newReturn.pickerStringFormat(home.locale);
    await network.getAllSelectedTripData(home.returnRoute).then((trips) {
      network.listReturnTrip.assignAll(trips);
      home.scheduleLoadings[1].value = false;
    });
  }

  Future<void> onOriginScheduleTap(int index) async {
    network.trip.value = Trip(
      id: network.listTrip[index].id,
      origin: network.listTrip[index].origin,
      destination: network.listTrip[index].destination,
      departure: network.listTrip[index].departure,
      arrival: network.listTrip[index].arrival,
      seats: network.listTrip[index].seats,
      price: network.listTrip[index].price,
    );
    if (home.roundTrip.value) {
      newReturnDate.value = null;
      Get.toNamed("/schedule_return");
      home.scheduleLoadings[1].value = true;
      await network
          .getAllSelectedTripData(home.returnRoute)
          .then((trips) async {
        network.listReturnTrip.assignAll(trips);
        await _filterReturnList();
      });
      return;
    }
    await Get.toNamed("/seat_origin");
  }

  Future<void> onReturnScheduleTap(int index) async {
    network.returnTrip.value = Trip(
      id: network.listReturnTrip[index].id,
      origin: network.listReturnTrip[index].origin,
      destination: network.listReturnTrip[index].destination,
      departure: network.listReturnTrip[index].departure,
      arrival: network.listReturnTrip[index].arrival,
      seats: network.listReturnTrip[index].seats,
      price: network.listReturnTrip[index].price,
    );
    await Get.toNamed("/seat_origin");
  }
}
