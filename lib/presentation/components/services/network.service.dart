import 'package:get/get.dart';
import 'package:wander_ways/features/network/data/network.data.dart';
import 'package:wander_ways/features/network/domain/network.domain.dart';

class NetworkService extends GetxService {
  final RestApiRepo _restApiRepo = RestApiRepo();

  NetworkGetAllUseCase _getAllData(IRestApi repo) => NetworkGetAllUseCase(
        repo: repo,
      );

  NetworkGetSingleUseCase _getSingleData(IRestApi repo) =>
      NetworkGetSingleUseCase(
        repo: repo,
      );

  NetworkPutUseCase _putData(IRestApi repo) => NetworkPutUseCase(
        repo: repo,
      );

  var listTrip = <Trip>[].obs;
  var listReturnTrip = <Trip>[].obs;
  // var trip = const Trip().obs;
  // var returnTrip = const Trip().obs;

  Future<List<Trip>> _getAllTripData() async {
    return await _getAllData(_restApiRepo).invoke() as List<Trip>;
  }

  Future<List<Trip>> getAllSelectedTripData(List<String> routes) async {
    var res = await _getAllTripData();
    var tripList = <Trip>[];

    for (var r in res) {
      if (r.origin == routes[0] && r.destination == routes[1]) {
        tripList.add(r);
      }
    }

    return tripList;
  }

  Future<Trip> getSingleTripData(int tid) async {
    return await _getSingleData(_restApiRepo).invoke(params: {
      "tid": tid,
    }) as Trip;
  }

  Future<Trip> updateTripSeat(Trip trip) async {
    return await _putData(_restApiRepo).invoke(params: {
      "trip": trip,
    }) as Trip;
  }
}
