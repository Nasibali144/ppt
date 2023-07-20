import 'package:ppt/models/api_response/api_response.dart';
import 'package:ppt/services/network_service.dart';

abstract class TodoRepository {
  Future<ResponseTodos> getTodos(int page);
}

class TodoRepositoryImpl implements TodoRepository {
  final Network client;

  const TodoRepositoryImpl({required this.client});

  @override
  Future<ResponseTodos> getTodos(int page) async {
    final json = await client.get(api: Api.todos, query: Api.query(page: page));
    return ResponseTodos.fromJson(json!);
  }
}