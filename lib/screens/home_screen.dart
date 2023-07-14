import 'package:flutter/material.dart';
import 'package:ppt/controllers/post_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"),),
      body: Consumer<PostController>(
        builder: (context, controller, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              final post = controller.list[index];
              return Card(
                child: ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.body!),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
