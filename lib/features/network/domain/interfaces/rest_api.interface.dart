abstract class IRestApi {
  Future<List<Object>> getAllData({Map<String, dynamic>? params});

  Future<Object?> getSingleData({Map<String, dynamic>? params});

  Future<Object?> putData({Map<String, dynamic>? params});
}
