import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.model.freezed.dart';
part 'purchase.model.g.dart';

@freezed
class Purchase with _$Purchase {
  @JsonSerializable(explicitToJson: true)
  const factory Purchase({
    int? id,
    int? uid,
    @JsonKey(name: "booking_id") String? bookingId,
    int? passenger,
    @JsonKey(name: "round_trip") int? roundTrip,
    @JsonKey(name: "departure_trip_id") int? departureTripId,
    @JsonKey(name: "departure_ticket_id") String? departureTicketId,
    @JsonKey(name: "departure_date") String? departureDate,
    @JsonKey(name: "departure_seats") String? departureSeats,
    @JsonKey(name: "departure_price") int? departurePrice,
    @JsonKey(name: "return_trip_id") int? returnTripId,
    @JsonKey(name: "return_ticket_id") String? returnTicketId,
    @JsonKey(name: "return_date") String? returnDate,
    @JsonKey(name: "return_seats") String? returnSeats,
    @JsonKey(name: "return_price") int? returnPrice,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "paid_at") String? paidAt,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}
