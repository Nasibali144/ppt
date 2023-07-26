import 'package:flutter/material.dart';
import 'package:ppt/core/service_locator.dart';
import 'app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const TodoApp());
}