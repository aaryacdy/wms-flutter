// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPasswordResponse _$ResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordResponse {
  dynamic get body => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;
  dynamic get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordResponseCopyWith<ResetPasswordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordResponseCopyWith<$Res> {
  factory $ResetPasswordResponseCopyWith(ResetPasswordResponse value,
          $Res Function(ResetPasswordResponse) then) =
      _$ResetPasswordResponseCopyWithImpl<$Res, ResetPasswordResponse>;
  @useResult
  $Res call({dynamic body, dynamic message, dynamic success});
}

/// @nodoc
class _$ResetPasswordResponseCopyWithImpl<$Res,
        $Val extends ResetPasswordResponse>
    implements $ResetPasswordResponseCopyWith<$Res> {
  _$ResetPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordResponseImplCopyWith<$Res>
    implements $ResetPasswordResponseCopyWith<$Res> {
  factory _$$ResetPasswordResponseImplCopyWith(
          _$ResetPasswordResponseImpl value,
          $Res Function(_$ResetPasswordResponseImpl) then) =
      __$$ResetPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic body, dynamic message, dynamic success});
}

/// @nodoc
class __$$ResetPasswordResponseImplCopyWithImpl<$Res>
    extends _$ResetPasswordResponseCopyWithImpl<$Res,
        _$ResetPasswordResponseImpl>
    implements _$$ResetPasswordResponseImplCopyWith<$Res> {
  __$$ResetPasswordResponseImplCopyWithImpl(_$ResetPasswordResponseImpl _value,
      $Res Function(_$ResetPasswordResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$ResetPasswordResponseImpl(
      body: freezed == body ? _value.body! : body,
      message: freezed == message ? _value.message! : message,
      success: freezed == success ? _value.success! : success,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordResponseImpl implements _ResetPasswordResponse {
  const _$ResetPasswordResponseImpl(
      {this.body = '', this.message = '', this.success = false});

  factory _$ResetPasswordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordResponseImplFromJson(json);

  @override
  @JsonKey()
  final dynamic body;
  @override
  @JsonKey()
  final dynamic message;
  @override
  @JsonKey()
  final dynamic success;

  @override
  String toString() {
    return 'ResetPasswordResponse(body: $body, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordResponseImpl &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.success, success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(success));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordResponseImplCopyWith<_$ResetPasswordResponseImpl>
      get copyWith => __$$ResetPasswordResponseImplCopyWithImpl<
          _$ResetPasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordResponse implements ResetPasswordResponse {
  const factory _ResetPasswordResponse(
      {final dynamic body,
      final dynamic message,
      final dynamic success}) = _$ResetPasswordResponseImpl;

  factory _ResetPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordResponseImpl.fromJson;

  @override
  dynamic get body;
  @override
  dynamic get message;
  @override
  dynamic get success;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordResponseImplCopyWith<_$ResetPasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
