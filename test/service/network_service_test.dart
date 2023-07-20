import 'package:dio/dio.dart';
import 'package:ppt/services/network_service.dart';
import 'package:test/test.dart';

void main() {
  group("Dio Test", () {
    final dio = DioService(dio: Dio());
    dio.configuration(Api.baseUrl);
    test("get method test", () async {
      final response = await dio.get(api: Api.todos);
      expect(response, isMap);
    });
  });
}