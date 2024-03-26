import 'package:json_annotation/json_annotation.dart';

part 'purchase.dto.g.dart';

@JsonSerializable()
class PurchaseDTO {
  final int? id;
  final int? uid;
  @JsonKey(name: "booking_id")
  final String? bookingId;
  @JsonKey(name: "ticket_id")
  final String? ticketId;
  final int? passenger;
  final String? seats;
  final int? tid;
  @JsonKey(name: "price")
  final int? price;
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
    this.ticketId,
    this.passenger,
    this.seats,
    this.tid,
    this.price,
    this.paymentStatus,
    this.createdAt,
    this.paidAt,
  });

  factory PurchaseDTO.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseDTOToJson(this);
}
