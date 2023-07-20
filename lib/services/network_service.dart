import 'package:dio/dio.dart';
import 'log_service.dart';

abstract class Network {
  const Network();

  Future<Map<String, dynamic>?> get({required String api, Map<String, String>? query});
  // Future<String?> post();
  // Future<String?> put();
  // Future<String?> delete();
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
  Future<Map<String, dynamic>?> get({required String api, Map<String, String>? query}) async {
    try {
      final response = await dio.get(api, queryParameters: query);
      if(response.statusCode == 200 || response.statusCode == 201) {
        LogService.d("${response.data}");
        return response.data;
      }
    } catch (e) {
      LogService.e("$e");
    }
    return null;
  }
}

sealed class Api {
  static const baseUrl = "https://api.nstack.in";
  static const todos = "/v1/todos";
}
