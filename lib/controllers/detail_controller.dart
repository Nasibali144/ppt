import 'package:ppt/controllers/base_controller.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/repositories/todo_repository.dart';

class DetailController extends BaseController {
  DetailController({required this.repository});

  final TodoRepository repository;

  /// related home screen
  late Todo todo;
  bool isLoading = false;

  void fetchTodos(String id) async {
    isLoading = true;
    notifyListeners();

    todo = await repository.getTodo(id);

    isLoading = false;
    notifyListeners();
  }
}