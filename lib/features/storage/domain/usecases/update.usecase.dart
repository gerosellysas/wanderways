import '../interfaces/storage.interface.dart';

class StorageUpdateUseCase {
  StorageUpdateUseCase({
    required IStorage repo,
  }) : _repo = repo;

  final IStorage _repo;

  Future<Object?> invoke({Map<String, dynamic>? params}) async {
    return await _repo.update(params: params);
  }
}
