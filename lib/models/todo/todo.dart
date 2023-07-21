import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

final json = {
  "createdAt": "createdAt 1",
  "updatedAt": "updatedAt 1",
  "isComplete": false,
  "title": "title 1",
  "description": "description 1",
  "id": "1"
};

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String createdAt,
    required String updatedAt,
    required bool isComplete,
    required String title,
    required String description,
    required String id,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
