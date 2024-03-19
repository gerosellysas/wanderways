// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseImpl _$$PurchaseImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseImpl(
      id: json['id'] as int?,
      uid: json['uid'] as int?,
      bookingNumber: json['booking_number'] as String?,
      passenger: json['passenger'] as String?,
      seat: json['seat'] as String?,
      tid: json['tid'] as int?,
      totalPrice: json['total_price'] as String?,
      paymentStatus: json['payment_status'] as String?,
      paidAt: json['paid_at'] as String?,
    );

Map<String, dynamic> _$$PurchaseImplToJson(_$PurchaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'booking_number': instance.bookingNumber,
      'passenger': instance.passenger,
      'seat': instance.seat,
      'tid': instance.tid,
      'total_price': instance.totalPrice,
      'payment_status': instance.paymentStatus,
      'paid_at': instance.paidAt,
    };
