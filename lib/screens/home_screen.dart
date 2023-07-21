import 'package:flutter/material.dart';
import 'package:ppt/controllers/home_controller.dart';
import 'package:ppt/core/app_root.dart';
import 'package:ppt/core/service_locator.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      /// init state
      create: (context) => locator<HomeController>()..init(),
      builder: (context, child) {
        return WillPopScope(
          /// dispose
          onWillPop: () async {
            context.read<HomeController>().close();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Todos"),
            ),
            body: Consumer<HomeController>(
              builder: (context, controller, child) {
                return Stack(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        final todo = controller.items[index];
                        return ItemCard(todo: todo);
                      },
                    ),

                    if(controller.isLoading) const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  final Todo todo;
  const ItemCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          AppRoutes.goDetailFromHome(context: context, key: key, id: todo.id);
        },
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: Checkbox(
          value: todo.isComplete,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

