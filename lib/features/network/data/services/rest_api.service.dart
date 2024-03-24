import 'package:dio/dio.dart';
import 'package:wander_ways/infrastructure/sources/api/api.dart';

class RestApiService {
  static final RestApiService instance = RestApiService._();
  factory RestApiService() => instance;
  static Dio? _dio;

  RestApiService._();

  static const _url = API.url;

  Future<Dio> get dio async {
    if (_dio != null) return _dio!;
    _dio = Dio();
    return _dio!;
  }

  Future<List<dynamic>> getAllData() async {
    Dio? d = await dio;
    try {
      final response = await d.get(_url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> getSingleData(int tid) async {
    Dio? d = await dio;
    try {
      final response = await d.get("$_url$tid");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Object?> putData(int tid, {required Map<String, dynamic> data}) async {
    Dio? d = await dio;
    try {
      final response = await d.put(
        "$_url$tid",
        data: data,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
