import 'package:freezed_annotation/freezed_annotation.dart';

part 'header.freezed.dart';
part 'header.g.dart';

@freezed
class Header with _$Header {
  const factory Header({
    required int code,
    required bool success,
    required int timestamp,
    required String message,
}) = _Header;

  factory Header.fromJson(Map<String, Object?> json) => _$HeaderFromJson(json);
}
