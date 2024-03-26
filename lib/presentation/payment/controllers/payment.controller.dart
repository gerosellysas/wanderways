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
    print("=====> ${seat.originSeatNumbers}");
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
      ticketIDs[1].value = home.originRoute.generateTicketID(
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
    var newSeats = <String>[];
    for (var i = 0; i < trip.value.seats!.length; i++) {
      for (var s in bookedSeats) {
        if ((s.value - 1) == i) {
          newSeats.insert(i, "booked");
        } else {
          newSeats.insert(i, trip.value.seats![i]);
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
    var originPurchase = Purchase(
      uid: storage.user.value.id,
      bookingId: seat.bookingID.value,
      ticketId: paid.value ? ticketIDs[0].value : null,
      tid: network.trip.value.id,
      passenger: seat.passenger.value,
      seats: seat.originSeatNumbers
          .map((s) => s.value)
          .toList()
          .seatNumberToString(),
      price: seat.passenger.value * network.trip.value.price!,
      paymentStatus: paid.value ? "paid" : "wait",
      paidAt: paid.value ? nowStr : null,
    );
    await storage.upsertPurchase(originPurchase);
    await _updateTripSeats(network.trip, seat.originSeatNumbers);
    if (home.roundTrip.value) {
      var returnPurchase = Purchase(
        uid: storage.user.value.id,
        bookingId: seat.bookingID.value,
        ticketId: paid.value ? ticketIDs[1].value : null,
        tid: network.returnTrip.value.id,
        passenger: seat.passenger.value,
        seats: seat.returnSeatNumbers
            .map((s) => s.value)
            .toList()
            .seatNumberToString(),
        price: seat.passenger.value * network.returnTrip.value.price!,
        paymentStatus: paid.value ? "paid" : "wait",
        paidAt: paid.value ? nowStr : null,
      );
      await storage.upsertPurchase(returnPurchase);
      await _updateTripSeats(network.returnTrip, seat.returnSeatNumbers);
    }
    _onPaymentPaid();
  }

  Future<void> _onPaymentPaid() async {
    loading.value = false;
    await Get.off(
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
    await Get.offAllNamed(
      "/dashboard",
      arguments: {
        "language": storage.language.value,
        "index": 0.obs,
      },
    );
  }

  Future<void> _goToTicketScreen() async {
    await Get.offAllNamed("/ticket");
  }
}
