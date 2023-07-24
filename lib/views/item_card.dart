import 'package:flutter/material.dart';
import 'package:ppt/controllers/todo_controller.dart';
import 'package:ppt/core/app_root.dart';
import 'package:ppt/models/todo/todo.dart';
import 'package:ppt/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final Todo todo;
  const ItemCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Provider.of<TodoController>(context, listen: false).checkDetail(id: todo.id);
          AppRoutes.goDetailFromHome(context: context, key: key, id: todo.id);
        },
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: Checkbox(
          value: todo.isComplete,
          onChanged: (value) {
            context.read<TodoController>().changeCompletedTodo(todo.id);
          },
        ),
      ),
    );
  }
}