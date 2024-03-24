import '../../domain/network.domain.dart';
import '../dto/trip.dto.dart';
import '../services/rest_api.service.dart';

class RestApiRepo implements IRestApi {
  RestApiRepo({
    RestApiService? service,
  }) : _service = service ?? RestApiService();

  final RestApiService _service;

  @override
  Future<List<Trip>> getAllData({Map<String, dynamic>? params}) async {
    var res = await _service.getAllData() as List<Map<String, dynamic>>;
    var tripDTOs = res.map((tDTO) => TripDTO.fromJson(tDTO)).toList();
    var trips = <Trip>[];
    for (var tripDTO in tripDTOs) {
      trips.add(Trip(
        id: int.parse(tripDTO.id!),
        origin: tripDTO.origin,
        destination: tripDTO.destination,
        arrival: tripDTO.arrival,
        departure: tripDTO.departure,
        seats: tripDTO.seats,
        price: tripDTO.price,
      ));
    }
    return trips;
  }

  @override
  Future<Trip?> getSingleData({Map<String, dynamic>? params}) async {
    var res = await _service.getSingleData(params!["tid"] as int)
        as Map<String, dynamic>;
    var tripDTO = TripDTO.fromJson(res);
    return Trip(
      id: int.parse(tripDTO.id!),
      origin: tripDTO.origin,
      destination: tripDTO.destination,
      arrival: tripDTO.arrival,
      departure: tripDTO.departure,
      seats: tripDTO.seats,
      price: tripDTO.price,
    );
  }

  @override
  Future<Trip?> putData({Map<String, dynamic>? params}) async {
    var trip = params!["trip"] as Trip;
    var res = await _service.putData(
      trip.id!,
      data: {
        "seats": trip.seats,
      },
    ) as Map<String, dynamic>;
    var tripDTO = TripDTO.fromJson(res);
    return trip.copyWith(seats: tripDTO.seats);
  }
}
