// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseDTO _$PurchaseDTOFromJson(Map<String, dynamic> json) => PurchaseDTO(
      id: json['id'] as int?,
      uid: json['uid'] as int?,
      bookingId: json['booking_id'] as String?,
      ticketId: json['ticket_id'] as String?,
      passenger: json['passenger'] as int?,
      seats: json['seats'] as String?,
      tid: json['tid'] as int?,
      price: json['price'] as int?,
      paymentStatus: json['payment_status'] as String?,
      createdAt: json['created_at'] as String?,
      paidAt: json['paid_at'] as String?,
    );

Map<String, dynamic> _$PurchaseDTOToJson(PurchaseDTO instance) =>
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
      'created_at': instance.createdAt,
      'paid_at': instance.paidAt,
    };
