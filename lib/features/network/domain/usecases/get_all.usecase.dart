import '../interfaces/rest_api.interface.dart';

class NetworkGetAllUseCase {
  NetworkGetAllUseCase({
    required IRestApi repo,
  }) : _repo = repo;

  final IRestApi _repo;

  Future<List<Object>> invoke({Map<String, dynamic>? params}) async {
    return await _repo.getAllData(params: params);
  }
}
