import 'package:ppt/models/todo/todo.dart';
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

  @override
  Future<Todo> completeTodo(String id, bool isComplete) {
    // TODO: implement completeTodo
    throw UnimplementedError();
  }

  @override
  Future<Todo> createTodo(Todo todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<Todo> updateTodo(String id, Todo todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }


}