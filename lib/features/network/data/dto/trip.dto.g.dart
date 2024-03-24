// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDTO _$TripDTOFromJson(Map<String, dynamic> json) => TripDTO(
      id: json['id'] as String?,
      route: json['route'] as Map<String, dynamic>?,
      schedule: json['schedule'] as Map<String, dynamic>?,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$TripDTOToJson(TripDTO instance) => <String, dynamic>{
      'id': instance.id,
      'route': instance.route,
      'schedule': instance.schedule,
      'seats': instance.seats,
      'price': instance.price,
    };
