import 'package:flutter/material.dart';
import 'package:ppt/app.dart';

import 'core/setup_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const PostApp());
}