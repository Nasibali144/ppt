import 'package:dio/dio.dart';
import 'log_service.dart';

abstract class Network {
  const Network();

  Future<Object?> get({required String api, Map<String, String>? query, String? id});
  Future<Object?> post({required String api, required Map<String, Object?> data});
  Future<Object?> put({required String api, required Map<String, Object?> data, required String id});
  Future<Object?> patch({required String api, required Map<String, Object?> data, required String id});
  Future<Object?> delete({required String api, required String id});
}

class DioService extends Network{
  final Dio dio;
  const DioService({required this.dio});

  void configuration(String baseUrl) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 4),
      receiveTimeout: const Duration(seconds: 4),
      contentType: Headers.jsonContentType,
    );
  }

  @override
  Future<Object?> get({required String api, Map<String, String>? query, String? id}) async {
    try {
      final response = await dio.get("$api${id != null ? "/$id" : ""}", queryParameters: query);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        // LogService.d("${response.data}");
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> post({required String api, required Map<String, Object?> data}) async {
    try {
      final response = await dio.post(api, data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> patch({required String api, required Map<String, Object?> data, required String id}) async  {
    try {
      final response = await dio.patch("$api/$id", data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> put({required String api, required Map<String, Object?> data, required String id}) async {
    try {
      final response = await dio.put("$api/$id", data: data);
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }

  @override
  Future<Object?> delete({required String api, required String id}) async {
    try {
      final response = await dio.delete("$api/$id");
      LogService.d("${response.data}");

      if(response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }
}

sealed class Api {
  static const baseUrl = "https://64b924fd79b7c9def6c0a410.mockapi.io";
  static const todos = "/todos";

  static Map<String, String> query({int page = 1, int limit = 10}) => {
    "page": page.toString(),
    "limit": limit.toString() ,
  };
}
