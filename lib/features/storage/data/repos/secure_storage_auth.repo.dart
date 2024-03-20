import '../../domain/storage.domain.dart';
import '../services/secure_storage.service.dart';

class SecureStorageAuthRepo implements IStorage {
  SecureStorageAuthRepo({
    SecureStorageService? service,
  }) : _service = service ?? SecureStorageService();

  final SecureStorageService _service;

  static const String _authSecureKey = "auth_secure_key";

  @override
  Future<List<Object>> fetchAll({Map<String, dynamic>? params}) async {
    return [];
  }

  @override
  Future<String> read({Map<String, dynamic>? params}) async {
    return await _service.read(_authSecureKey) ?? "";
  }

  @override
  Future<void> insert({Map<String, dynamic>? params}) async {
    return await _service.write(
      _authSecureKey,
      params!["user_credential"] as String,
    );
  }

  @override
  Future<void> update({Map<String, dynamic>? params}) async {}

  @override
  Future<void> delete({Map<String, dynamic>? params}) async {
    return await _service.delete(_authSecureKey);
  }
}
