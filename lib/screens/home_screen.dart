import 'package:flutter/material.dart';
import 'package:ppt/controllers/home_controller.dart';
import 'package:ppt/core/service_locator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (context) => locator<HomeController>(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Todos"),
          ),
          body: Consumer<HomeController>(
            builder: (context, controller, child) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final todo = controller.items[index];
                  return Card(
                    child: ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {},
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
