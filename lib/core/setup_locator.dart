
import 'package:get_it/get_it.dart';
import 'package:ppt/repositories/post_repository.dart';
import 'package:ppt/services/network.dart';

final locator = GetIt.instance;

void serviceLocator() {
  locator.registerLazySingleton<Network>(() => IONetwork());
  locator.registerLazySingleton<BaseRepository>(() => PostRepository(locator()));
}