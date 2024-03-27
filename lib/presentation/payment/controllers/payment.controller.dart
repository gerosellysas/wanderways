import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/presentation/components/components.dart';

import '../../home/controllers/home.controller.dart';
import '../../schedule/controllers/schedule.controller.dart';
import '../../seat/controllers/seat.controller.dart';
import '../overlays/payment.overlays.dart';

class PaymentController extends GetxController {
  final SeatController seat = Get.find<SeatController>();
  ScheduleController get schedule => seat.schedule;
  HomeController get home => schedule.home;
  StorageService get storage => home.storage;
  NetworkService get network => home.network;

  var ticketIDs = ["".obs, "".obs];
  var paid = false.obs;
  var loading = false.obs;

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

  Future<void> generateTicketID() async {
    ticketIDs[0].value = home.originRoute.generateTicketID(
      uid: storage.user.value.id!,
      tid: network.trip.value.id!,
      seats: seat.originSeatNumbers.map((s) => s.value).toList(),
      date: home.selectedDates[0].value,
      departure: network.trip.value.departure!,
    );
    if (home.roundTrip.value) {
      ticketIDs[1].value = home.returnRoute.generateTicketID(
        uid: storage.user.value.id!,
        tid: network.returnTrip.value.id!,
        seats: seat.returnSeatNumbers.map((s) => s.value).toList(),
        date: schedule.newReturnDate.value ?? home.selectedDates[1].value,
        departure: network.returnTrip.value.departure!,
      );
    }
  }

  void onPaidChanged(bool? isPaid) {
    paid.value = isPaid!;
  }

  Future<void> _updateTripSeats(Rx<Trip> trip, List<RxInt> bookedSeats) async {
    bookedSeats.sort((a, b) => a.value.compareTo(b.value));
    var newSeats = <String>[];
    newSeats.assignAll(trip.value.seats!);
    for (var s in bookedSeats) {
      for (var i = 0; i < newSeats.length; i++) {
        if ((s.value - 1) == i) {
          newSeats[i] = "booked";
        }
      }
    }
    trip.value = trip.value.copyWith(seats: newSeats);
    await network.updateTripSeat(trip.value);
  }

  Future<void> onConfirmPaymentTapped() async {
    loading.value = true;
    if (paid.value) await generateTicketID();
    var nowStr = DateTime.now().toLocal().toIso8601String();
    storage.purchase.value = Purchase(
      uid: storage.user.value.id,
      bookingId: seat.bookingID.value,
      passenger: seat.passenger.value,
      roundTrip: home.roundTrip.value ? 1 : 0,
      departureTripId: network.trip.value.id!,
      departureTicketId: paid.value ? ticketIDs[0].value : null,
      departureDate: home.selectedDates[0].value,
      departureSeats: seat.originSeatNumbers
          .map((s) => s.value)
          .toList()
          .seatNumberToString(),
      departurePrice: seat.passenger.value * network.trip.value.price!,
      returnTripId: network.returnTrip.value.id,
      returnTicketId: home.roundTrip.value
          ? paid.value
              ? ticketIDs[1].value
              : null
          : null,
      returnDate: home.roundTrip.value ? home.selectedDates[1].value : null,
      returnSeats: home.roundTrip.value
          ? seat.returnSeatNumbers
              .map((s) => s.value)
              .toList()
              .seatNumberToString()
          : null,
      returnPrice: home.roundTrip.value
          ? seat.passenger.value * network.returnTrip.value.price!
          : null,
      paymentStatus: paid.value ? "paid" : "wait",
      paidAt: paid.value ? nowStr : null,
    );
    await storage.upsertPurchase(storage.purchase.value);
    await _updateTripSeats(network.trip, seat.originSeatNumbers);
    if (home.roundTrip.value) {
      await _updateTripSeats(network.returnTrip, seat.returnSeatNumbers);
    }
    await _resetHomeVariable();
    paid.value ? _onPaymentPaid() : _onPaymentPaidPopped(false);
  }

  Future<void> _onPaymentPaid() async {
    loading.value = false;
    await Get.to(
      () => Obx(() => PaymentPaid(
            onPop: _onPaymentPaidPopped,
            languageSelected: storage.language.value,
            roundTrip: home.roundTrip.value,
            onViewTicketTap: _goToTicketScreen,
          )),
      routeName: "/payment_paid",
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 250),
    );
  }

  Future<void> _onPaymentPaidPopped(bool pop) async {
    if (pop) return;
    await Get.offNamedUntil(
      "/dashboard",
      arguments: {
        "language": storage.language.value,
        "index": 0.obs,
      },
      ModalRoute.withName("/dashboard"),
    );
  }

  Future<void> _goToTicketScreen() async {
    await _resetHomeVariable();
    await Get.offNamedUntil(
      "/booking_status",
      ModalRoute.withName("/dashboard"),
    );
  }

  Future<void> _resetHomeVariable() async {
    home.selectedLocations.assignAll([Rxn(null), Rxn(null)]);
    home.locationEmpties.assignAll([false.obs, false.obs]);
    home.selectedDates.assignAll([
      DateTime.now().toLocal().pickerStringFormat(home.locale).obs,
      DateTime.now().toLocal().pickerStringFormat(home.locale).obs,
    ]);
    home.pickerDates.assignAll([Rxn(null), Rxn(null)]);
    home.selectedSeat.value =
        storage.language.value == 0 ? "1 kursi" : "1 seat";
    home.roundTrip.value = false;
    home.returnFieldAnimation.reset();
  }
}
