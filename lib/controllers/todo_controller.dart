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

  Future<void> createTodo(String id, String title, String description) async {
    isLoading = true;
    notifyListeners();

    Todo todo = await repository.createTodo(Todo(createdAt: DateTime.now().toString(), updatedAt: DateTime.now().toString(), isComplete: false, title: title, description: description, id: "00"));
    todos.add(todo);

    isLoading = false;
    notifyListeners();
  }
}