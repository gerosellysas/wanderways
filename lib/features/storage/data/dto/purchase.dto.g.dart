// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseDTO _$PurchaseDTOFromJson(Map<String, dynamic> json) => PurchaseDTO(
      id: json['id'] as int?,
      uid: json['uid'] as int?,
      bookingNumber: json['booking_number'] as String?,
      passenger: json['passenger'] as String?,
      seat: json['seat'] as String?,
      tid: json['tid'] as int?,
      totalPrice: json['total_price'] as String?,
      paymentStatus: json['payment_status'] as String?,
      createdAt: json['created_at'] as String?,
      paidAt: json['paid_at'] as String?,
    );

Map<String, dynamic> _$PurchaseDTOToJson(PurchaseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'booking_number': instance.bookingNumber,
      'passenger': instance.passenger,
      'seat': instance.seat,
      'tid': instance.tid,
      'total_price': instance.totalPrice,
      'payment_status': instance.paymentStatus,
      'created_at': instance.createdAt,
      'paid_at': instance.paidAt,
    };
