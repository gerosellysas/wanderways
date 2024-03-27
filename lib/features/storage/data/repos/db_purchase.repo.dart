import '../../domain/storage.domain.dart';
import '../dto/purchase.dto.dart';
import '../services/db.service.dart';

class DBPurchaseRepo implements IStorage {
  DBPurchaseRepo({
    DBService? service,
  }) : _service = service ?? DBService();

  final DBService _service;

  static const String _table = "purchase_table";

  @override
  Future<List<Purchase>> fetchAll({Map<String, dynamic>? params}) async {
    var res = await _service.fetchAll(_table);
    var purchaseDTOs = res.map((pDTO) => PurchaseDTO.fromJson(pDTO)).toList();
    var purchaseList = <Purchase>[];
    for (var purchaseDTO in purchaseDTOs) {
      purchaseList.add(Purchase(
        id: purchaseDTO.id,
        uid: purchaseDTO.uid,
        bookingId: purchaseDTO.bookingId,
        passenger: purchaseDTO.passenger,
        roundTrip: purchaseDTO.roundTrip,
        departureTripId: purchaseDTO.departureTripId,
        departureTicketId: purchaseDTO.departureTicketId,
        departureDate: purchaseDTO.departureDate,
        departureSeats: purchaseDTO.departureSeats,
        departurePrice: purchaseDTO.departurePrice,
        returnTripId: purchaseDTO.returnTripId,
        returnTicketId: purchaseDTO.returnTicketId,
        returnDate: purchaseDTO.returnDate,
        returnSeats: purchaseDTO.returnSeats,
        returnPrice: purchaseDTO.returnPrice,
        paymentStatus: purchaseDTO.paymentStatus,
        paidAt: purchaseDTO.paidAt,
      ));
    }
    return purchaseList;
  }

  @override
  Future<Purchase> read({Map<String, dynamic>? params}) async {
    var res = await _service.read(_table, id: params!["pid"] as int);
    var purchaseDTO = PurchaseDTO.fromJson(res);
    return Purchase(
      id: purchaseDTO.id,
      uid: purchaseDTO.uid,
      bookingId: purchaseDTO.bookingId,
      passenger: purchaseDTO.passenger,
      roundTrip: purchaseDTO.roundTrip,
      departureTripId: purchaseDTO.departureTripId,
      departureTicketId: purchaseDTO.departureTicketId,
      departureDate: purchaseDTO.departureDate,
      departureSeats: purchaseDTO.departureSeats,
      departurePrice: purchaseDTO.departurePrice,
      returnTripId: purchaseDTO.returnTripId,
      returnTicketId: purchaseDTO.returnTicketId,
      returnDate: purchaseDTO.returnDate,
      returnSeats: purchaseDTO.returnSeats,
      returnPrice: purchaseDTO.returnPrice,
      paymentStatus: purchaseDTO.paymentStatus,
      paidAt: purchaseDTO.paidAt,
    );
  }

  @override
  Future<int> insert({Map<String, dynamic>? params}) async {
    var purchase = params!["purchase"] as Purchase;
    return await _service.insert(
      _table,
      values: PurchaseDTO(
        id: purchase.id,
        uid: purchase.uid,
        bookingId: purchase.bookingId,
        passenger: purchase.passenger,
        roundTrip: purchase.roundTrip,
        departureTripId: purchase.departureTripId,
        departureTicketId: purchase.departureTicketId,
        departureDate: purchase.departureDate,
        departureSeats: purchase.departureSeats,
        departurePrice: purchase.departurePrice,
        returnTripId: purchase.returnTripId,
        returnTicketId: purchase.returnTicketId,
        returnDate: purchase.returnDate,
        returnSeats: purchase.returnSeats,
        returnPrice: purchase.returnPrice,
        paymentStatus: purchase.paymentStatus,
        createdAt: DateTime.now().toLocal().toIso8601String(),
        paidAt: purchase.paidAt,
      ).toJson(),
    );
  }

  @override
  Future<int> update({Map<String, dynamic>? params}) async {
    var purchase = params!["purchase"] as Purchase;
    return await _service.update(
      _table,
      values: PurchaseDTO(
        id: purchase.id,
        uid: purchase.uid,
        bookingId: purchase.bookingId,
        passenger: purchase.passenger,
        roundTrip: purchase.roundTrip,
        departureTripId: purchase.departureTripId,
        departureTicketId: purchase.departureTicketId,
        departureDate: purchase.departureDate,
        departureSeats: purchase.departureSeats,
        departurePrice: purchase.departurePrice,
        returnTripId: purchase.returnTripId,
        returnTicketId: purchase.returnTicketId,
        returnDate: purchase.returnDate,
        returnSeats: purchase.returnSeats,
        returnPrice: purchase.returnPrice,
        paymentStatus: purchase.paymentStatus,
        paidAt: purchase.paidAt,
      ).toJson(),
    );
  }

  @override
  Future<int> delete({Map<String, dynamic>? params}) async {
    return await _service.delete(_table, id: params!["pid"] as int);
  }
}
