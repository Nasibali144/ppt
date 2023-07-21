import 'package:ppt/controllers/base_controller.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/repositories/todo_repository.dart';

class HomeController extends BaseController {
  HomeController({required this.repository});

  final TodoRepository repository;

  /// related home screen
  List<Todo> items = [];
  bool isLoading = false;

  void fetchTodos() async {
    isLoading = true;
    notifyListeners();

    items = await repository.getTodos();

    isLoading = false;
    notifyListeners();
  }

  @override
  void close() {
    // TODO: implement close
  }

  @override
  void init() {
    super.init();
    fetchTodos();
  }
}