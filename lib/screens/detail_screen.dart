import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String? id;
  const DetailScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

enum Status {
  read,
  create,
  edit,
}