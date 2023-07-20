// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  int get code => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call({int code, bool success, int timestamp, String message});
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? success = null,
    Object? timestamp = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, bool success, int timestamp, String message});
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$_Header>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? success = null,
    Object? timestamp = null,
    Object? message = null,
  }) {
    return _then(_$_Header(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Header implements _Header {
  const _$_Header(
      {required this.code,
      required this.success,
      required this.timestamp,
      required this.message});

  factory _$_Header.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderFromJson(json);

  @override
  final int code;
  @override
  final bool success;
  @override
  final int timestamp;
  @override
  final String message;

  @override
  String toString() {
    return 'Header(code: $code, success: $success, timestamp: $timestamp, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, success, timestamp, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderToJson(
      this,
    );
  }
}

abstract class _Header implements Header {
  const factory _Header(
      {required final int code,
      required final bool success,
      required final int timestamp,
      required final String message}) = _$_Header;

  factory _Header.fromJson(Map<String, dynamic> json) = _$_Header.fromJson;

  @override
  int get code;
  @override
  bool get success;
  @override
  int get timestamp;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}
