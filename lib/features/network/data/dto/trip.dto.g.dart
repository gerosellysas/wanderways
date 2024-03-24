// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDTO _$TripDTOFromJson(Map<String, dynamic> json) => TripDTO(
      id: json['id'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      departure: json['departure'] as String?,
      arrival: json['arrival'] as String?,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as String?,
    );

Map<String, dynamic> _$TripDTOToJson(TripDTO instance) => <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'seats': instance.seats,
      'price': instance.price,
    };
