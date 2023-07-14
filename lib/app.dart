import 'package:flutter/material.dart';
import 'package:ppt/controllers/post_controller.dart';
import 'package:ppt/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'core/setup_locator.dart';

class PostApp extends StatelessWidget {
  const PostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostController>(
      create: (_) {
        final provider = PostController(http: locator(), repository: locator());
        provider.getAllPost();
        return provider;
      },
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
