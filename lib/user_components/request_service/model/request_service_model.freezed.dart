// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestServiceModel _$RequestServiceModelFromJson(Map<String, dynamic> json) {
  return _RequestServiceModel.fromJson(json);
}

/// @nodoc
mixin _$RequestServiceModel {
  String get categoryId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // XFile? attachment,
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestServiceModelCopyWith<RequestServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestServiceModelCopyWith<$Res> {
  factory $RequestServiceModelCopyWith(
          RequestServiceModel value, $Res Function(RequestServiceModel) then) =
      _$RequestServiceModelCopyWithImpl<$Res, RequestServiceModel>;
  @useResult
  $Res call(
      {String categoryId,
      String userId,
      String name,
      String weight,
      String price,
      String longitude,
      String latitude,
      String description,
      String id});
}

/// @nodoc
class _$RequestServiceModelCopyWithImpl<$Res, $Val extends RequestServiceModel>
    implements $RequestServiceModelCopyWith<$Res> {
  _$RequestServiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? userId = null,
    Object? name = null,
    Object? weight = null,
    Object? price = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? description = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestServiceModelImplCopyWith<$Res>
    implements $RequestServiceModelCopyWith<$Res> {
  factory _$$RequestServiceModelImplCopyWith(_$RequestServiceModelImpl value,
          $Res Function(_$RequestServiceModelImpl) then) =
      __$$RequestServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String userId,
      String name,
      String weight,
      String price,
      String longitude,
      String latitude,
      String description,
      String id});
}

/// @nodoc
class __$$RequestServiceModelImplCopyWithImpl<$Res>
    extends _$RequestServiceModelCopyWithImpl<$Res, _$RequestServiceModelImpl>
    implements _$$RequestServiceModelImplCopyWith<$Res> {
  __$$RequestServiceModelImplCopyWithImpl(_$RequestServiceModelImpl _value,
      $Res Function(_$RequestServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? userId = null,
    Object? name = null,
    Object? weight = null,
    Object? price = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? description = null,
    Object? id = null,
  }) {
    return _then(_$RequestServiceModelImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestServiceModelImpl implements _RequestServiceModel {
  _$RequestServiceModelImpl(
      {this.categoryId = '',
      this.userId = '',
      this.name = '',
      this.weight = '',
      this.price = '',
      this.longitude = '',
      this.latitude = '',
      this.description = '',
      this.id = ''});

  factory _$RequestServiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestServiceModelImplFromJson(json);

  @override
  @JsonKey()
  final String categoryId;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String weight;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String longitude;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String description;
// XFile? attachment,
  @override
  @JsonKey()
  final String id;

  @override
  String toString() {
    return 'RequestServiceModel(categoryId: $categoryId, userId: $userId, name: $name, weight: $weight, price: $price, longitude: $longitude, latitude: $latitude, description: $description, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestServiceModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, userId, name, weight,
      price, longitude, latitude, description, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestServiceModelImplCopyWith<_$RequestServiceModelImpl> get copyWith =>
      __$$RequestServiceModelImplCopyWithImpl<_$RequestServiceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestServiceModelImplToJson(
      this,
    );
  }
}

abstract class _RequestServiceModel implements RequestServiceModel {
  factory _RequestServiceModel(
      {final String categoryId,
      final String userId,
      final String name,
      final String weight,
      final String price,
      final String longitude,
      final String latitude,
      final String description,
      final String id}) = _$RequestServiceModelImpl;

  factory _RequestServiceModel.fromJson(Map<String, dynamic> json) =
      _$RequestServiceModelImpl.fromJson;

  @override
  String get categoryId;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get weight;
  @override
  String get price;
  @override
  String get longitude;
  @override
  String get latitude;
  @override
  String get description;
  @override // XFile? attachment,
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$RequestServiceModelImplCopyWith<_$RequestServiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
