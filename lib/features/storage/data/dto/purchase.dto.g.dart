// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseDTO _$PurchaseDTOFromJson(Map<String, dynamic> json) => PurchaseDTO(
      id: json['id'] as int?,
      uid: json['uid'] as int?,
      bookingId: json['booking_id'] as String?,
      passenger: json['passenger'] as int?,
      roundTrip: json['round_trip'] as int?,
      departureTripId: json['departure_trip_id'] as int?,
      departureTicketId: json['departure_ticket_id'] as String?,
      departureDate: json['departure_date'] as String?,
      departureSeats: json['departure_seats'] as String?,
      departurePrice: json['departure_price'] as int?,
      returnTripId: json['return_trip_id'] as int?,
      returnTicketId: json['return_ticket_id'] as String?,
      returnDate: json['return_date'] as String?,
      returnSeats: json['return_seats'] as String?,
      returnPrice: json['return_price'] as int?,
      paymentStatus: json['payment_status'] as String?,
      createdAt: json['created_at'] as String?,
      paidAt: json['paid_at'] as String?,
    );

Map<String, dynamic> _$PurchaseDTOToJson(PurchaseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'booking_id': instance.bookingId,
      'passenger': instance.passenger,
      'round_trip': instance.roundTrip,
      'departure_trip_id': instance.departureTripId,
      'departure_ticket_id': instance.departureTicketId,
      'departure_date': instance.departureDate,
      'departure_seats': instance.departureSeats,
      'departure_price': instance.departurePrice,
      'return_trip_id': instance.returnTripId,
      'return_ticket_id': instance.returnTicketId,
      'return_date': instance.returnDate,
      'return_seats': instance.returnSeats,
      'return_price': instance.returnPrice,
      'payment_status': instance.paymentStatus,
      'created_at': instance.createdAt,
      'paid_at': instance.paidAt,
    };
