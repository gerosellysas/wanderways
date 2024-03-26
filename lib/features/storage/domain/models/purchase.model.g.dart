// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseImpl _$$PurchaseImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseImpl(
      id: json['id'] as int?,
      uid: json['uid'] as int?,
      bookingId: json['booking_id'] as String?,
      ticketId: json['ticket_id'] as String?,
      passenger: json['passenger'] as int?,
      seats: json['seats'] as String?,
      tid: json['tid'] as int?,
      price: json['price'] as int?,
      paymentStatus: json['payment_status'] as String?,
      paidAt: json['paid_at'] as String?,
    );

Map<String, dynamic> _$$PurchaseImplToJson(_$PurchaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'booking_id': instance.bookingId,
      'ticket_id': instance.ticketId,
      'passenger': instance.passenger,
      'seats': instance.seats,
      'tid': instance.tid,
      'price': instance.price,
      'payment_status': instance.paymentStatus,
      'paid_at': instance.paidAt,
    };
