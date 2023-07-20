import 'package:flutter/material.dart';
import 'package:ppt/core/service_locator.dart';
import 'app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const TodoApp());
}