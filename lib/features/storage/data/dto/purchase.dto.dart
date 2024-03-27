import 'package:json_annotation/json_annotation.dart';

part 'purchase.dto.g.dart';

@JsonSerializable()
class PurchaseDTO {
  final int? id;
  final int? uid;
  @JsonKey(name: "booking_id")
  final String? bookingId;
  final int? passenger;
  @JsonKey(name: "round_trip")
  final int? roundTrip;
  @JsonKey(name: "departure_trip_id")
  final int? departureTripId;
  @JsonKey(name: "departure_ticket_id")
  final String? departureTicketId;
  @JsonKey(name: "departure_date")
  final String? departureDate;
  @JsonKey(name: "departure_seats")
  final String? departureSeats;
  @JsonKey(name: "departure_price")
  final int? departurePrice;
  @JsonKey(name: "return_trip_id")
  final int? returnTripId;
  @JsonKey(name: "return_ticket_id")
  final String? returnTicketId;
  @JsonKey(name: "return_date")
  final String? returnDate;
  @JsonKey(name: "return_seats")
  final String? returnSeats;
  @JsonKey(name: "return_price")
  final int? returnPrice;
  @JsonKey(name: "payment_status")
  final String? paymentStatus;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "paid_at")
  final String? paidAt;

  PurchaseDTO({
    this.id,
    this.uid,
    this.bookingId,
    this.passenger,
    this.roundTrip,
    this.departureTripId,
    this.departureTicketId,
    this.departureDate,
    this.departureSeats,
    this.departurePrice,
    this.returnTripId,
    this.returnTicketId,
    this.returnDate,
    this.returnSeats,
    this.returnPrice,
    this.paymentStatus,
    this.createdAt,
    this.paidAt,
  });

  factory PurchaseDTO.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseDTOToJson(this);
}
