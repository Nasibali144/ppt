import 'package:flutter/material.dart';

abstract class BaseController with ChangeNotifier {
  void init() {
    debugPrint("$runtimeType is initialized");
  }

  void close() {
    debugPrint("$runtimeType is closed");
  }
}