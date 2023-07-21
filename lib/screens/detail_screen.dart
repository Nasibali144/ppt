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
        return Scaffold();
      }
    );
  }
}
