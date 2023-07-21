import 'package:flutter/material.dart';
import 'package:ppt/controllers/todo_controller.dart';
import 'package:ppt/core/service_locator.dart';
import 'package:ppt/screens/home_screen.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoController>(
      create: (context) => locator<TodoController>()..fetchTodos(),
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
        title: "Todo App",
        home: const HomeScreen(),
      ),
    );
  }
}
