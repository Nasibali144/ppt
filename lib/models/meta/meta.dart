import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

final json = {
  "total_items": 20,
  "total_pages": 2,
  "per_page_item": 10,
  "current_page": 1,
  "page_size": 10,
  "has_more_page": true
};

@freezed
class Meta with _$Meta {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Meta({
    required int totalItems,
    required int totalPages,
    required int perPageItem,
    required int currentPage,
    required int pageSize,
    required bool hasMorePage,
}) =_Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}