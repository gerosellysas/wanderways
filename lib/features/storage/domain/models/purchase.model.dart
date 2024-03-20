import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.model.freezed.dart';
part 'purchase.model.g.dart';

@freezed
class Purchase with _$Purchase {
  @JsonSerializable(explicitToJson: true)
  const factory Purchase({
    int? id,
    int? uid,
    @JsonKey(name: "booking_number") String? bookingNumber,
    String? passenger,
    String? seat,
    int? tid,
    @JsonKey(name: "total_price") String? totalPrice,
    @JsonKey(name: "payment_status") String? paymentStatus,
    @JsonKey(name: "paid_at") String? paidAt,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}