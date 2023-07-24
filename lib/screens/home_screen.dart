import 'package:flutter/material.dart';
import 'package:ppt/controllers/todo_controller.dart';
import 'package:ppt/core/app_root.dart';
import 'package:ppt/views/item_card.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: Consumer<TodoController>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return ItemCard(todo: todo);
                },
              ),
              if (controller.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TodoController>(context, listen: false).checkDetail();
          AppRoutes.goDetailFromHome(context: context, key: key);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
