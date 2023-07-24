import 'package:flutter/material.dart';
import 'package:ppt/core/app_root.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/repositories/todo_repository.dart';
import 'package:ppt/screens/detail_screen.dart';
/// State Management:
/// page based
/// feature based

class TodoController with ChangeNotifier {
  final TodoRepository repository;

  TodoController({required this.repository});

  bool isLoading = false;
  List<Todo> todos = [];

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  Status status = Status.read;


  void fetchTodos() async {
    isLoading = true;
    notifyListeners();

    todos = await repository.getTodos();

    isLoading = false;
    notifyListeners();
  }



  Future<void> fetchTodo(String id) async {
    status = Status.read;
    Todo todo = await repository.getTodo(id);
    controllerTitle.text = todo.title;
    controllerDescription.text = todo.description;

    notifyListeners();
  }

  Future<void> deleteTodo(String id, BuildContext context) async {
   final result = await repository.deleteTodo(id);
   if(result) {
     /// TODO: success message
     todos.removeWhere((element) => element.id == id);
     notifyListeners();
     if(context.mounted) {
       AppRoutes.close(context);
     }
   } else {
     /// TODO: error message: "Something error" or "Check connection"
   }
  }

  void pressFAB(String? id, BuildContext context) async {
    if(status == Status.read) {
      status = Status.edit;
      notifyListeners();
    } else {
      bool result;
      if(status == Status.edit) {
        result = await editTodo(id!);
      } else {
        result = await createTodo();
      }
      if(context.mounted && result) {
        AppRoutes.close(context);
      }
    }
  }

  Future<bool> editTodo(String id) async {
    isLoading = true;
    notifyListeners();

    Todo todo = todos.firstWhere((element) => element.id == id);
    todo = await repository.updateTodo(id, Todo(createdAt: todo.createdAt, updatedAt: DateTime.now().toString(), isComplete: todo.isComplete, title: controllerTitle.text, description: controllerDescription.text, id: todo.id));
    todos.removeWhere((element) => element.id == id);
    todos.add(todo);

    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> createTodo() async {
    isLoading = true;
    notifyListeners();

    Todo todo = await repository.createTodo(Todo(createdAt: DateTime.now().toString(), updatedAt: DateTime.now().toString(), isComplete: false, title: controllerTitle.text, description: controllerDescription.text, id: "00"));
    todos.add(todo);

    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> changeCompletedTodo(String id) async {
    isLoading = true;
    notifyListeners();

    Todo todo = todos.firstWhere((element) => element.id == id);
    int index = todos.indexOf(todo);
    todo = await repository.completeTodo(id, !todo.isComplete);
    todos.replaceRange(index, index + 1, [todo]);

    isLoading = false;
    notifyListeners();
    return true;
  }

  void checkDetail({String? id}) async {
    controllerDescription.clear();
    controllerTitle.clear();
    if(id != null) {
      fetchTodo(id);
    } else {
      status = Status.create;
      notifyListeners();
    }
  }
}