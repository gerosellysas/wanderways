import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.model.freezed.dart';
part 'trip.model.g.dart';

@freezed
class Trip with _$Trip {
  @JsonSerializable(explicitToJson: true)
  const factory Trip({
    int? id,
    String? origin,
    String? destination,
    String? departure,
    String? arrival,
    List<String>? seats,
    String? price,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
