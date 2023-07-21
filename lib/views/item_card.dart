import 'package:flutter/material.dart';
import 'package:ppt/core/app_root.dart';
import 'package:ppt/models/todo/todo.dart';

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