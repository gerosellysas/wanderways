import 'package:get/get.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';
import 'package:wander_ways/infrastructure/sources/extensions/extensions.dart';
import 'package:wander_ways/presentation/components/components.dart';

class BookingController extends GetxController {
  final StorageService storage = Get.find<StorageService>();
  final NetworkService network = Get.find<NetworkService>();

  String get locale => Get.locale!.languageCode;

  var loading = true.obs;
  var purchaseListTrip = <Trip>[].obs;

  var ticketIDs = ["".obs, "".obs];

  @override
  void onInit() {
    //
    super.onInit();
  }

  @override
  void onReady() async {
    await _fetchPurchaseList();
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  Future<void> _fetchPurchaseList() async {
    loading.value = true;
    var purchases = await storage.fetchAllPurchase();
    var newPurchases = <Purchase>[];
    for (var p in purchases) {
      if (p.uid == storage.user.value.id) {
        newPurchases.add(p);
      }
    }
    storage.listPurchase.assignAll(newPurchases);
    await _fetchTripList();
    loading.value = false;
  }

  Future<void> _fetchTripList() async {
    var departureTrips = <Trip>[];
    var returnTrips = <Trip>[];
    for (var p in storage.listPurchase) {
      var departureTrip = await network.getSingleTripData(p.departureTripId!);
      departureTrips.add(departureTrip);
      if (p.roundTrip == 1) {
        var returnTrip = await network.getSingleTripData(p.returnTripId!);
        returnTrips.add(returnTrip);
      }
    }
    purchaseListTrip.assignAll([...departureTrips, ...returnTrips]);
  }

  Future<void> onBookingCardTapped(int pid) async {
    if (pid == -1) return;
    var pIndex = storage.listPurchase.indexWhere((p) => p.id == pid);
    storage.purchase.value = storage.listPurchase[pIndex];
    var tDepartureIndex = purchaseListTrip.indexWhere(
      (t) => t.id == storage.purchase.value.departureTripId,
    );
    network.trip.value = purchaseListTrip[tDepartureIndex];
    if (storage.purchase.value.roundTrip == 1) {
      var tReturnIndex = purchaseListTrip.indexWhere(
        (t) => t.id == storage.purchase.value.returnTripId,
      );
      network.returnTrip.value = purchaseListTrip[tReturnIndex];
    }
    await Get.toNamed("/booking_status");
  }

  Future<void> onBookingDeleteTapped(int pid) async {
    await storage.deletePurchase(pid);
    var pIndex = storage.listPurchase.indexWhere((p) => p.id == pid);
    storage.listPurchase.removeAt(pIndex);
    purchaseListTrip.removeAt(pIndex);
  }

  Future<void> onBookingStatusBackTapped(bool pop) async {
    if (pop) return;
    if (loading.value) return;
    Get.back();
  }

  //

  Future<void> generateTicketID() async {
    var originSeats =
        storage.purchase.value.departureSeats!.seatNumberToListInt();
    ticketIDs[0].value = [
      network.trip.value.origin!,
      network.trip.value.destination!,
    ].generateTicketID(
      uid: storage.user.value.id!,
      tid: network.trip.value.id!,
      seats: originSeats,
      date: storage.purchase.value.departureDate!,
      departure: network.trip.value.departure!,
    );
    if (storage.purchase.value.roundTrip == 1) {
      var returnSeats =
          storage.purchase.value.returnSeats!.seatNumberToListInt();
      ticketIDs[1].value = [
        network.returnTrip.value.origin!,
        network.returnTrip.value.destination!,
      ].generateTicketID(
        uid: storage.user.value.id!,
        tid: network.returnTrip.value.id!,
        seats: returnSeats,
        date: storage.purchase.value.returnDate!,
        departure: network.returnTrip.value.departure!,
      );
    }
  }

  Future<void> _updateTripSeats(Rx<Trip> trip, List<RxInt> bookedSeats) async {
    bookedSeats.sort((a, b) => a.value.compareTo(b.value));
    var newSeats = <String>[];
    newSeats.assignAll(trip.value.seats!);
    for (var s in bookedSeats) {
      for (var i = 0; i < newSeats.length; i++) {
        if ((s.value - 1) == i) {
          newSeats[i] = "available";
        }
      }
    }
    trip.value = trip.value.copyWith(seats: newSeats);
    await network.updateTripSeat(trip.value);
  }

  Future<void> onPayBookingTapped() async {
    loading.value = true;
    await generateTicketID();
    storage.purchase.value = storage.purchase.value.copyWith(
      departureTicketId: ticketIDs[0].value,
      returnTicketId: ticketIDs[1].value,
      paymentStatus: "paid",
      paidAt: DateTime.now().toLocal().toIso8601String(),
    );
    await storage.upsertPurchase(storage.purchase.value);
    storage.listPurchase.assignAll(await storage.fetchAllPurchase());
    loading.value = false;
  }

  Future<void> onCancelBookingTapped() async {
    loading.value = true;
    await generateTicketID();
    storage.purchase.value = storage.purchase.value.copyWith(
      departureTicketId: ticketIDs[0].value,
      returnTicketId: ticketIDs[1].value,
      paymentStatus: "cancel",
      paidAt: DateTime.now().toLocal().toIso8601String(),
    );
    await storage.upsertPurchase(storage.purchase.value);
    storage.listPurchase.assignAll(await storage.fetchAllPurchase());
    var originSeats =
        storage.purchase.value.departureSeats!.seatNumberToListInt();
    await _updateTripSeats(
      network.trip,
      originSeats.map((s) => s.obs).toList(),
    );
    if (storage.purchase.value.roundTrip == 1) {
      var returnSeats =
          storage.purchase.value.returnSeats!.seatNumberToListInt();
      await _updateTripSeats(
        network.returnTrip,
        returnSeats.map((s) => s.obs).toList(),
      );
    }
    loading.value = false;
  }
}
