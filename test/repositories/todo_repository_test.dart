import 'package:dio/dio.dart';
import 'package:ppt/repositories/todo_repository.dart';
import 'package:ppt/services/log_service.dart';
import 'package:ppt/services/network_service.dart';
import 'package:test/test.dart';

void main() {
  group("Repository", () {
    late final TodoRepository repository;
    setUp(() {
      final dio = DioService(
        dio: Dio(),
      );
      dio.configuration(Api.baseUrl);
      repository = TodoRepositoryImpl(
        client: dio,
      );
    });
  });
}
