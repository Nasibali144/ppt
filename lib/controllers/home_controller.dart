import 'package:flutter/material.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/repositories/todo_repository.dart';

class HomeController with ChangeNotifier {
  HomeController({required this.repository}) {
    fetchTodos();
  }

  final TodoRepository repository;

  /// related home screen
  List<Todo> items = [];
  bool isLoading = false;

  void fetchTodos() async {
    isLoading = true;
    notifyListeners();

    final responseTodos = await repository.getTodos(1);
    items = responseTodos.items;

    isLoading = false;
    notifyListeners();
  }
}