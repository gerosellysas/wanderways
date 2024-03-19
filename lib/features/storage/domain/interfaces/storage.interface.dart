abstract class IStorage {
  Future<List<Object>> fetchAll({Map<String, dynamic>? params});

  Future<Object?> read({Map<String, dynamic>? params});

  Future<Object?> insert({Map<String, dynamic>? params});

  Future<Object?> update({Map<String, dynamic>? params});

  Future<Object?> delete({Map<String, dynamic>? params});
}
