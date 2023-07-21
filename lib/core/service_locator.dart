import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ppt/controllers/todo_controller.dart';
import 'package:ppt/repositories/todo_repository.dart';
import 'package:ppt/services/network_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    networkService.configuration(Api.baseUrl);
    return networkService;
  });

  /// repository
  locator.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(client: locator()));

  /// controller
  locator.registerFactory<TodoController>(() => TodoController(repository: locator()));
}
