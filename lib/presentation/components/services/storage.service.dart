import 'package:get/get.dart';
import 'package:wander_ways/features/storage/data/storages.data.dart';
import 'package:wander_ways/features/storage/domain/storage.domain.dart';

class StorageService extends GetxService {
  final DBUserRepo _dbUserRepo = DBUserRepo();
  final SecureStorageAuthRepo _secureAuthRepo = SecureStorageAuthRepo();

  StorageFetchAllUseCase _fetchAll(IStorage repo) => StorageFetchAllUseCase(
        repo: repo,
      );

  StorageCreateUseCase _create(IStorage repo) => StorageCreateUseCase(
        repo: repo,
      );

  StorageReadUseCase _read(IStorage repo) => StorageReadUseCase(
        repo: repo,
      );

  StorageUpdateUseCase _update(IStorage repo) => StorageUpdateUseCase(
        repo: repo,
      );

  StorageDeleteUseCase _delete(IStorage repo) => StorageDeleteUseCase(
        repo: repo,
      );

  Future<List<User>> fetchAllUser() async {
    return await _fetchAll(_dbUserRepo).invoke() as List<User>;
  }

  var listUser = <User>[].obs;
  var user = const User().obs;

  Future<User?> fetchSingleUser(int uid) async {
    return await _read(_dbUserRepo).invoke(
      params: {
        "uid": uid,
      },
    ) as User?;
  }

  Future<void> upsertUser(User user) async {
    if (user.id != null) {
      await _create(_dbUserRepo).invoke(
        params: {
          "user": user,
        },
      );
      return;
    }
    await _update(_dbUserRepo).invoke(
      params: {
        "user": user,
      },
    );
  }

  Future<void> deleteUser(int uid) async {
    await _delete(_dbUserRepo).invoke(
      params: {
        "user": uid,
      },
    );
  }

  Future<String> loadLoggedUser() async {
    return await _create(_secureAuthRepo).invoke() as String;
  }

  Future<void> saveLoggedUser(String email) async {
    await _create(_secureAuthRepo).invoke(
      params: {
        "user_credential": email,
      },
    );
  }

  Future<void> removeLoggedUser() async {
    await _delete(_secureAuthRepo).invoke();
  }
}
