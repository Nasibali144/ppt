import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ppt/services/log_service.dart';
import 'package:ppt/services/network_service.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("Dio Test", () {
    final dio = DioService(dio: Dio());
    dio.configuration(Api.baseUrl);

    test("get method test", () async {
      final response = await dio.get(api: Api.todos);
      expect(response, isMap);
    });

    test("get method one", () async {
      // final response = await Dio(BaseOptions(baseUrl: "https://api.nstack.in", headers: {"accept": "application/json"})).get("/v1/todos/644833ac36e3b29e56a93f5d");
      // final response = await dio.get(api: Api.todos, id: "6383b9587149f0c9646f4e8e");

      var response = await http.put(
        Uri.parse('https://api.nstack.in/v1/todos/644833ac36e3b29e56a93f5d'),
        headers: {
          // "Host": "<calculated when request is sent>",
          // "User-Agent": "PostmanRuntime/7.32.3",
          "Accept": "*/*",
          // "Accept-Encoding": "gzip, deflate, br",
          // "Connection": "keep-alive",
        },
        body:{
          "title": "B8 TODO",
          "description": "Ibratli",
          "is_completed": true.toString()
        }
      );
      LogService.d(await response.body);

      expect("response", isA<String>());
    });
  });
}
