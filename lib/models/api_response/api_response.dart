import 'package:ppt/models/api_response/header.dart';
import 'package:ppt/models/meta/meta.dart';
import 'package:ppt/models/todo/todo.dart';

class ResponseTodos {
  final Header header;
  final List<Todo> items;
  final Meta meta;

  const ResponseTodos({
    required this.items,
    required this.meta,
    required this.header,
  });

  factory ResponseTodos.fromJson(Map<String, Object?> json) {
    final items = (json['items'] as List).map((item) => Todo.fromJson(item)).toList();
    final meta = Meta.fromJson(json['meta'] as Map<String, dynamic>);
    final header = Header.fromJson(json);

    return ResponseTodos(items: items, meta: meta, header: header);
  }
}

class TodoResponse {
  final Todo data;
  final Header header;

  const TodoResponse({
    required this.header,
    required this.data,
  });

  factory TodoResponse.fromJson(Map<String, Object?> json) {
    final data = Todo.fromJson(json['data'] as Map<String, dynamic>);
    final header = Header.fromJson(json);

    return TodoResponse(header: header, data: data);
  }
}
