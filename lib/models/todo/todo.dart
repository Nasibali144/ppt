import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

final json = {
  "_id": "64b3b4103f14bf64b7c754f3",
  "title": "rrrr",
  "description": "dddd",
  "is_completed": true,
  "created_at": "2023-07-16T09:10:40.271Z",
  "updated_at": "2023-07-16T09:10:40.271Z"
};

@freezed
class Todo with _$Todo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Todo({
    @JsonKey(name: "_id") required String id,
    required String title,
    required String description,
    required bool isCompleted,
    required String createdAt,
    required String updatedAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
