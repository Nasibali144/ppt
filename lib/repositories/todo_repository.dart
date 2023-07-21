import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/services/network_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(String id);
}

class TodoRepositoryImpl implements TodoRepository {
  final Network client;

  const TodoRepositoryImpl({required this.client});

  @override
  Future<List<Todo>> getTodos() async {
    final json = await client.get(api: Api.todos) as List;
    json.map((item) => Todo.fromJson(item as Map<String, dynamic>)).toList();
    return json.map((item) => Todo.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<Todo> getTodo(String id) async {
    final json = await client.get(api: Api.todos, id: id) as Map<String, dynamic>;
    return Todo.fromJson(json);
  }
}