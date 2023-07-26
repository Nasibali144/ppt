import 'package:ppt/core/connectivities.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/services/db_service.dart';
import 'package:ppt/services/network_service.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(String id);

  Future<bool> deleteTodo(String id);

  Future<Todo> updateTodo(String id, Todo todo);

  Future<Todo> createTodo(Todo todo);

  Future<Todo> completeTodo(String id, bool isComplete);
}

class TodoRepositoryImpl implements TodoRepository {
  final Network client;
  final DatabaseHelper database;
  final ConnectionChecker connectivity;

  const TodoRepositoryImpl({
    required this.client,
    required this.database,
    required this.connectivity,
  });

  @override
  Future<List<Todo>> getTodos() async {
    final json = await client.get(api: Api.todos) as List;
    json.map((item) => Todo.fromJson(item as Map<String, dynamic>)).toList();
    return json
        .map((item) => Todo.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Todo> getTodo(String id) async {
    final json =
        await client.get(api: Api.todos, id: id) as Map<String, dynamic>;
    return Todo.fromJson(json);
  }

  @override
  Future<Todo> completeTodo(String id, bool isComplete) async {
    final json = await client.patch(
        api: Api.todos,
        data: {"isComplete": isComplete},
        id: id) as Map<String, dynamic>;
    return Todo.fromJson(json);
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    final json = await client.post(api: Api.todos, data: todo.toJson())
        as Map<String, dynamic>;
    return Todo.fromJson(json);
  }

  @override
  Future<bool> deleteTodo(String id) async {
    final json = await client.delete(api: Api.todos, id: id);
    return json != null;
  }

  @override
  Future<Todo> updateTodo(String id, Todo todo) async {
    final json = await client.put(api: Api.todos, data: todo.toJson(), id: id)
        as Map<String, dynamic>;
    return Todo.fromJson(json);
  }
}
