import 'package:flutter/material.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/repositories/todo_repository.dart';

class TodoController with ChangeNotifier {
  final TodoRepository repository;

  TodoController({required this.repository});

  bool isLoading = false;
  List<Todo> todos = [];

  void fetchTodos() async {
    isLoading = true;
    notifyListeners();

    todos = await repository.getTodos();

    isLoading = false;
    notifyListeners();
  }

  Future<Todo> fetchTodo(String id) async {
    isLoading = true;
    notifyListeners();

    Todo todo = await repository.getTodo(id);

    isLoading = false;
    notifyListeners();

    return todo;
  }
}