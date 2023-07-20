import 'package:dio/dio.dart';
import 'package:ppt/models/api_response/api_response.dart';
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

    test("getTodos", () async {
      final todos = await repository.getTodos(1);
      LogService.d(todos.items.toString());
      expect(todos, const TypeMatcher<ResponseTodos>());
    });
  });
}
