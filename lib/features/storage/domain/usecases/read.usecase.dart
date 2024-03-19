import '../interfaces/storage.interface.dart';

class StorageReadUseCase {
  StorageReadUseCase({
    required IStorage repo,
  }) : _repo = repo;

  final IStorage _repo;

  Future<Object?> invoke({Map<String, dynamic>? params}) async {
    return await _repo.read(params: params);
  }
}
