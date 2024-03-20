import '../../domain/storage.domain.dart';
import '../services/shared_pref.service.dart';

class SharedPrefLanguageRepo implements IStorage {
  SharedPrefLanguageRepo({
    SharedPrefService? service,
  }) : _service = service ?? SharedPrefService();

  final SharedPrefService _service;

  static const String _key = "language_pref_key";

  @override
  Future<List<Object>> fetchAll({Map<String, dynamic>? params}) async {
    return [];
  }

  @override
  Future<int?> read({Map<String, dynamic>? params}) async {
    await _service.reload();
    return await _service.readInt(_key, 0);
  }

  @override
  Future<bool> insert({Map<String, dynamic>? params}) async {
    return await _service.writeInt(_key, params!["language"]);
  }

  @override
  Future<bool> update({Map<String, dynamic>? params}) async {
    return await _service.writeInt(_key, params!["language"]);
  }

  @override
  Future<bool> delete({Map<String, dynamic>? params}) async {
    return await _service.delete(_key);
  }
}
