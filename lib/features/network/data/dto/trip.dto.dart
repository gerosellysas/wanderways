import 'package:json_annotation/json_annotation.dart';

part 'trip.dto.g.dart';

@JsonSerializable()
class TripDTO {
  final String? id;
  final Map<String, dynamic>? route;
  final Map<String, dynamic>? schedule;
  final List<String>? seats;
  final int? price;

  TripDTO({
    this.id,
    this.route,
    this.schedule,
    this.seats,
    this.price,
  });

  factory TripDTO.fromJson(Map<String, dynamic> json) =>
      _$TripDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TripDTOToJson(this);
}
