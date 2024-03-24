// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as int?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      departure: json['departure'] as String?,
      arrival: json['arrival'] as String?,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'seats': instance.seats,
      'price': instance.price,
    };
