import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ppt/controllers/connectivity_controller.dart';
import 'package:ppt/controllers/todo_controller.dart';
import 'package:ppt/repositories/todo_repository.dart';
import 'package:ppt/services/network_service.dart';

import 'connectivities.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    networkService.configuration(Api.baseUrl);
    return networkService;
  });

  /// connectivity
  final connectivity = Connectivity();
  locator.registerLazySingleton<ConnectionChecker>(
        () => ConnectionCheckerImpl(
      connectivity: connectivity,
    ),
  );

  /// repository
  locator.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(client: locator()));

  /// controller
  locator.registerFactory<TodoController>(() => TodoController(repository: locator()));

  locator.registerLazySingleton<ConnectivityController>(
        () => ConnectivityController(
      checker: locator(),
    ),
  );
}
