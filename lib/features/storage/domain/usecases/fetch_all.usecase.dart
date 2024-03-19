import '../interfaces/storage.interface.dart';

class StorageFetchAllUseCase {
  StorageFetchAllUseCase({
    required IStorage repo,
  }) : _repo = repo;

  final IStorage _repo;

  Future<List<Object>> invoke({Map<String, dynamic>? params}) async {
    return await _repo.fetchAll(params: params);
  }
}
