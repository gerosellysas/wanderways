import '../interfaces/rest_api.interface.dart';

class NetworkGetSingleUseCase {
  NetworkGetSingleUseCase({
    required IRestApi repo,
  }) : _repo = repo;

  final IRestApi _repo;

  Future<Object?> invoke({Map<String, dynamic>? params}) async {
    return await _repo.getSingleData(params: params);
  }
}
