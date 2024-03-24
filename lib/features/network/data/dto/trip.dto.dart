import 'package:json_annotation/json_annotation.dart';

part 'trip.dto.g.dart';

@JsonSerializable()
class TripDTO {
  final String? id;
  final String? origin;
  final String? destination;
  final String? departure;
  final String? arrival;
  final List<String>? seats;
  final String? price;

  TripDTO({
    this.id,
    this.origin,
    this.destination,
    this.departure,
    this.arrival,
    this.seats,
    this.price,
  });

  factory TripDTO.fromJson(Map<String, dynamic> json) =>
      _$TripDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TripDTOToJson(this);
}
