import 'package:flutter/foundation.dart';
import 'package:ppt/repositories/post_repository.dart';
import 'package:ppt/services/network.dart';

import '../models/post.dart';

class PostController extends ChangeNotifier {
  List<Post> list = [];
  final Network http;
  final BaseRepository repository;

  PostController({required this.http, required this.repository});

  void getAllPost() async {
    list = await repository.getAllData();
    notifyListeners();
  }
}