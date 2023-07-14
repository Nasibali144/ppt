import 'dart:convert';

import 'package:ppt/models/post.dart';

import '../services/network.dart';

abstract class BaseRepository {
  Future<List<Post>> getAllData();
}

class PostRepository implements BaseRepository {
  final Network http;
  PostRepository(this.http);

  @override
  Future<List<Post>> getAllData() async {
    final response = await http.get(Api.baseUrl, Api.post.path);
    List post = jsonDecode(response) as List;
    List<Post> posts = post.map<Post>((map) => Post.fromJson(map)).toList();
    return posts;
  }
}