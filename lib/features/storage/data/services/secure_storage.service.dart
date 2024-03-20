import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService instance = SecureStorageService._();
  factory SecureStorageService() => instance;
  static FlutterSecureStorage? _secureStorage;

  SecureStorageService._();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<FlutterSecureStorage> get secureStorage async {
    if (_secureStorage != null) return _secureStorage!;
    _secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    return _secureStorage!;
  }

  Future<void> write(String key, String value) async {
    FlutterSecureStorage? sStorage = await secureStorage;
    return await sStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    FlutterSecureStorage? sStorage = await secureStorage;
    return await sStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    FlutterSecureStorage? sStorage = await secureStorage;
    return await sStorage.delete(key: key);
  }
}
