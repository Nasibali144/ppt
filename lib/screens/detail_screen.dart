import 'package:flutter/material.dart';
import 'package:ppt/controllers/detail_controller.dart';
import 'package:ppt/core/service_locator.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String? id;

  const DetailScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailController>(
      create: (context) => locator<DetailController>()..fetchTodos(id!),
      builder: (context, child) {
        return Consumer<DetailController>(
          builder: (context, controller, child) {
            if (controller.todo != null) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(controller.todo!.title),
                  actions: [
                    Checkbox(
                      value: controller.todo!.isComplete,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    controller.todo!.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            }

            return Scaffold(
              body: Center(
                child: controller.isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        "No Data",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
