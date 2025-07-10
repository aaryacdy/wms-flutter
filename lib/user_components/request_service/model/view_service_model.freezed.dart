// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WastageResponse _$WastageResponseFromJson(Map<String, dynamic> json) {
  return _WastageResponse.fromJson(json);
}

/// @nodoc
mixin _$WastageResponse {
  List<WastageItem> get body => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WastageResponseCopyWith<WastageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WastageResponseCopyWith<$Res> {
  factory $WastageResponseCopyWith(
          WastageResponse value, $Res Function(WastageResponse) then) =
      _$WastageResponseCopyWithImpl<$Res, WastageResponse>;
  @useResult
  $Res call({List<WastageItem> body, String message, bool success});
}

/// @nodoc
class _$WastageResponseCopyWithImpl<$Res, $Val extends WastageResponse>
    implements $WastageResponseCopyWith<$Res> {
  _$WastageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as List<WastageItem>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WastageResponseImplCopyWith<$Res>
    implements $WastageResponseCopyWith<$Res> {
  factory _$$WastageResponseImplCopyWith(_$WastageResponseImpl value,
          $Res Function(_$WastageResponseImpl) then) =
      __$$WastageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WastageItem> body, String message, bool success});
}

/// @nodoc
class __$$WastageResponseImplCopyWithImpl<$Res>
    extends _$WastageResponseCopyWithImpl<$Res, _$WastageResponseImpl>
    implements _$$WastageResponseImplCopyWith<$Res> {
  __$$WastageResponseImplCopyWithImpl(
      _$WastageResponseImpl _value, $Res Function(_$WastageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$WastageResponseImpl(
      body: null == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as List<WastageItem>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WastageResponseImpl implements _WastageResponse {
  const _$WastageResponseImpl(
      {final List<WastageItem> body = const [],
      this.message = '',
      this.success = false})
      : _body = body;

  factory _$WastageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WastageResponseImplFromJson(json);

  final List<WastageItem> _body;
  @override
  @JsonKey()
  List<WastageItem> get body {
    if (_body is EqualUnmodifiableListView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_body);
  }

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'WastageResponse(body: $body, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WastageResponseImpl &&
            const DeepCollectionEquality().equals(other._body, _body) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_body), message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WastageResponseImplCopyWith<_$WastageResponseImpl> get copyWith =>
      __$$WastageResponseImplCopyWithImpl<_$WastageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WastageResponseImplToJson(
      this,
    );
  }
}

abstract class _WastageResponse implements WastageResponse {
  const factory _WastageResponse(
      {final List<WastageItem> body,
      final String message,
      final bool success}) = _$WastageResponseImpl;

  factory _WastageResponse.fromJson(Map<String, dynamic> json) =
      _$WastageResponseImpl.fromJson;

  @override
  List<WastageItem> get body;
  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$WastageResponseImplCopyWith<_$WastageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WastageItem _$WastageItemFromJson(Map<String, dynamic> json) {
  return _WastageItem.fromJson(json);
}

/// @nodoc
mixin _$WastageItem {
  int get id => throw _privateConstructorUsedError;
  CreatedBy get createdBy => throw _privateConstructorUsedError;
  CreatedBy? get modifiedBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  WastageType get wastageType => throw _privateConstructorUsedError;
  CreatedBy? get approvedBy => throw _privateConstructorUsedError;
  String? get approvedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WastageItemCopyWith<WastageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WastageItemCopyWith<$Res> {
  factory $WastageItemCopyWith(
          WastageItem value, $Res Function(WastageItem) then) =
      _$WastageItemCopyWithImpl<$Res, WastageItem>;
  @useResult
  $Res call(
      {int id,
      CreatedBy createdBy,
      CreatedBy? modifiedBy,
      String createdDate,
      String? modifiedDate,
      String name,
      String weight,
      double price,
      String? address,
      String? location,
      String longitude,
      String? latitude,
      String? status,
      String? categoryName,
      String description,
      String? image,
      WastageType wastageType,
      CreatedBy? approvedBy,
      String? approvedDate});

  $CreatedByCopyWith<$Res> get createdBy;
  $CreatedByCopyWith<$Res>? get modifiedBy;
  $WastageTypeCopyWith<$Res> get wastageType;
  $CreatedByCopyWith<$Res>? get approvedBy;
}

/// @nodoc
class _$WastageItemCopyWithImpl<$Res, $Val extends WastageItem>
    implements $WastageItemCopyWith<$Res> {
  _$WastageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? modifiedBy = freezed,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
    Object? name = null,
    Object? weight = null,
    Object? price = null,
    Object? address = freezed,
    Object? location = freezed,
    Object? longitude = null,
    Object? latitude = freezed,
    Object? status = freezed,
    Object? categoryName = freezed,
    Object? description = null,
    Object? image = freezed,
    Object? wastageType = null,
    Object? approvedBy = freezed,
    Object? approvedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      wastageType: null == wastageType
          ? _value.wastageType
          : wastageType // ignore: cast_nullable_to_non_nullable
              as WastageType,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      approvedDate: freezed == approvedDate
          ? _value.approvedDate
          : approvedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res> get createdBy {
    return $CreatedByCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get modifiedBy {
    if (_value.modifiedBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.modifiedBy!, (value) {
      return _then(_value.copyWith(modifiedBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WastageTypeCopyWith<$Res> get wastageType {
    return $WastageTypeCopyWith<$Res>(_value.wastageType, (value) {
      return _then(_value.copyWith(wastageType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get approvedBy {
    if (_value.approvedBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.approvedBy!, (value) {
      return _then(_value.copyWith(approvedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WastageItemImplCopyWith<$Res>
    implements $WastageItemCopyWith<$Res> {
  factory _$$WastageItemImplCopyWith(
          _$WastageItemImpl value, $Res Function(_$WastageItemImpl) then) =
      __$$WastageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CreatedBy createdBy,
      CreatedBy? modifiedBy,
      String createdDate,
      String? modifiedDate,
      String name,
      String weight,
      double price,
      String? address,
      String? location,
      String longitude,
      String? latitude,
      String? status,
      String? categoryName,
      String description,
      String? image,
      WastageType wastageType,
      CreatedBy? approvedBy,
      String? approvedDate});

  @override
  $CreatedByCopyWith<$Res> get createdBy;
  @override
  $CreatedByCopyWith<$Res>? get modifiedBy;
  @override
  $WastageTypeCopyWith<$Res> get wastageType;
  @override
  $CreatedByCopyWith<$Res>? get approvedBy;
}

/// @nodoc
class __$$WastageItemImplCopyWithImpl<$Res>
    extends _$WastageItemCopyWithImpl<$Res, _$WastageItemImpl>
    implements _$$WastageItemImplCopyWith<$Res> {
  __$$WastageItemImplCopyWithImpl(
      _$WastageItemImpl _value, $Res Function(_$WastageItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? modifiedBy = freezed,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
    Object? name = null,
    Object? weight = null,
    Object? price = null,
    Object? address = freezed,
    Object? location = freezed,
    Object? longitude = null,
    Object? latitude = freezed,
    Object? status = freezed,
    Object? categoryName = freezed,
    Object? description = null,
    Object? image = freezed,
    Object? wastageType = null,
    Object? approvedBy = freezed,
    Object? approvedDate = freezed,
  }) {
    return _then(_$WastageItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      wastageType: null == wastageType
          ? _value.wastageType
          : wastageType // ignore: cast_nullable_to_non_nullable
              as WastageType,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      approvedDate: freezed == approvedDate
          ? _value.approvedDate
          : approvedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WastageItemImpl implements _WastageItem {
  const _$WastageItemImpl(
      {this.id = 0,
      this.createdBy = const CreatedBy(),
      this.modifiedBy,
      this.createdDate = '',
      this.modifiedDate,
      this.name = '',
      this.weight = '',
      this.price = 0.0,
      this.address,
      this.location,
      this.longitude = '',
      this.latitude,
      this.status,
      this.categoryName,
      this.description = '',
      this.image,
      this.wastageType = const WastageType(),
      this.approvedBy,
      this.approvedDate});

  factory _$WastageItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WastageItemImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final CreatedBy createdBy;
  @override
  final CreatedBy? modifiedBy;
  @override
  @JsonKey()
  final String createdDate;
  @override
  final String? modifiedDate;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String weight;
  @override
  @JsonKey()
  final double price;
  @override
  final String? address;
  @override
  final String? location;
  @override
  @JsonKey()
  final String longitude;
  @override
  final String? latitude;
  @override
  final String? status;
  @override
  final String? categoryName;
  @override
  @JsonKey()
  final String description;
  @override
  final String? image;
  @override
  @JsonKey()
  final WastageType wastageType;
  @override
  final CreatedBy? approvedBy;
  @override
  final String? approvedDate;

  @override
  String toString() {
    return 'WastageItem(id: $id, createdBy: $createdBy, modifiedBy: $modifiedBy, createdDate: $createdDate, modifiedDate: $modifiedDate, name: $name, weight: $weight, price: $price, address: $address, location: $location, longitude: $longitude, latitude: $latitude, status: $status, categoryName: $categoryName, description: $description, image: $image, wastageType: $wastageType, approvedBy: $approvedBy, approvedDate: $approvedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WastageItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.wastageType, wastageType) ||
                other.wastageType == wastageType) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.approvedDate, approvedDate) ||
                other.approvedDate == approvedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdBy,
        modifiedBy,
        createdDate,
        modifiedDate,
        name,
        weight,
        price,
        address,
        location,
        longitude,
        latitude,
        status,
        categoryName,
        description,
        image,
        wastageType,
        approvedBy,
        approvedDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WastageItemImplCopyWith<_$WastageItemImpl> get copyWith =>
      __$$WastageItemImplCopyWithImpl<_$WastageItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WastageItemImplToJson(
      this,
    );
  }
}

abstract class _WastageItem implements WastageItem {
  const factory _WastageItem(
      {final int id,
      final CreatedBy createdBy,
      final CreatedBy? modifiedBy,
      final String createdDate,
      final String? modifiedDate,
      final String name,
      final String weight,
      final double price,
      final String? address,
      final String? location,
      final String longitude,
      final String? latitude,
      final String? status,
      final String? categoryName,
      final String description,
      final String? image,
      final WastageType wastageType,
      final CreatedBy? approvedBy,
      final String? approvedDate}) = _$WastageItemImpl;

  factory _WastageItem.fromJson(Map<String, dynamic> json) =
      _$WastageItemImpl.fromJson;

  @override
  int get id;
  @override
  CreatedBy get createdBy;
  @override
  CreatedBy? get modifiedBy;
  @override
  String get createdDate;
  @override
  String? get modifiedDate;
  @override
  String get name;
  @override
  String get weight;
  @override
  double get price;
  @override
  String? get address;
  @override
  String? get location;
  @override
  String get longitude;
  @override
  String? get latitude;
  @override
  String? get status;
  @override
  String? get categoryName;
  @override
  String get description;
  @override
  String? get image;
  @override
  WastageType get wastageType;
  @override
  CreatedBy? get approvedBy;
  @override
  String? get approvedDate;
  @override
  @JsonKey(ignore: true)
  _$$WastageItemImplCopyWith<_$WastageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get salt => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
  @useResult
  $Res call(
      {int id,
      String name,
      String salt,
      String username,
      String password,
      String email,
      String? address,
      String? mobileNo,
      String? profilePicture,
      String? role,
      bool blocked,
      bool status,
      String createdDate,
      String? modifiedDate});
}

/// @nodoc
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? salt = null,
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? address = freezed,
    Object? mobileNo = freezed,
    Object? profilePicture = freezed,
    Object? role = freezed,
    Object? blocked = null,
    Object? status = null,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedByImplCopyWith<$Res>
    implements $CreatedByCopyWith<$Res> {
  factory _$$CreatedByImplCopyWith(
          _$CreatedByImpl value, $Res Function(_$CreatedByImpl) then) =
      __$$CreatedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String salt,
      String username,
      String password,
      String email,
      String? address,
      String? mobileNo,
      String? profilePicture,
      String? role,
      bool blocked,
      bool status,
      String createdDate,
      String? modifiedDate});
}

/// @nodoc
class __$$CreatedByImplCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$CreatedByImpl>
    implements _$$CreatedByImplCopyWith<$Res> {
  __$$CreatedByImplCopyWithImpl(
      _$CreatedByImpl _value, $Res Function(_$CreatedByImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? salt = null,
    Object? username = null,
    Object? password = null,
    Object? email = null,
    Object? address = freezed,
    Object? mobileNo = freezed,
    Object? profilePicture = freezed,
    Object? role = freezed,
    Object? blocked = null,
    Object? status = null,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$CreatedByImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      salt: null == salt
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedByImpl implements _CreatedBy {
  const _$CreatedByImpl(
      {this.id = 0,
      this.name = '',
      this.salt = '',
      this.username = '',
      this.password = '',
      this.email = '',
      this.address,
      this.mobileNo,
      this.profilePicture,
      this.role,
      this.blocked = false,
      this.status = false,
      this.createdDate = '',
      this.modifiedDate});

  factory _$CreatedByImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedByImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String salt;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String email;
  @override
  final String? address;
  @override
  final String? mobileNo;
  @override
  final String? profilePicture;
  @override
  final String? role;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String createdDate;
  @override
  final String? modifiedDate;

  @override
  String toString() {
    return 'CreatedBy(id: $id, name: $name, salt: $salt, username: $username, password: $password, email: $email, address: $address, mobileNo: $mobileNo, profilePicture: $profilePicture, role: $role, blocked: $blocked, status: $status, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.salt, salt) || other.salt == salt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      salt,
      username,
      password,
      email,
      address,
      mobileNo,
      profilePicture,
      role,
      blocked,
      status,
      createdDate,
      modifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      __$$CreatedByImplCopyWithImpl<_$CreatedByImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedByImplToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
      {final int id,
      final String name,
      final String salt,
      final String username,
      final String password,
      final String email,
      final String? address,
      final String? mobileNo,
      final String? profilePicture,
      final String? role,
      final bool blocked,
      final bool status,
      final String createdDate,
      final String? modifiedDate}) = _$CreatedByImpl;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$CreatedByImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get salt;
  @override
  String get username;
  @override
  String get password;
  @override
  String get email;
  @override
  String? get address;
  @override
  String? get mobileNo;
  @override
  String? get profilePicture;
  @override
  String? get role;
  @override
  bool get blocked;
  @override
  bool get status;
  @override
  String get createdDate;
  @override
  String? get modifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$CreatedByImplCopyWith<_$CreatedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WastageType _$WastageTypeFromJson(Map<String, dynamic> json) {
  return _WastageType.fromJson(json);
}

/// @nodoc
mixin _$WastageType {
  int get id => throw _privateConstructorUsedError;
  CreatedBy get createdBy => throw _privateConstructorUsedError;
  CreatedBy? get modifiedBy => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WastageTypeCopyWith<WastageType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WastageTypeCopyWith<$Res> {
  factory $WastageTypeCopyWith(
          WastageType value, $Res Function(WastageType) then) =
      _$WastageTypeCopyWithImpl<$Res, WastageType>;
  @useResult
  $Res call(
      {int id,
      CreatedBy createdBy,
      CreatedBy? modifiedBy,
      String createdDate,
      String? modifiedDate,
      String name,
      double price,
      String description,
      String? icon,
      bool status});

  $CreatedByCopyWith<$Res> get createdBy;
  $CreatedByCopyWith<$Res>? get modifiedBy;
}

/// @nodoc
class _$WastageTypeCopyWithImpl<$Res, $Val extends WastageType>
    implements $WastageTypeCopyWith<$Res> {
  _$WastageTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? modifiedBy = freezed,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? icon = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res> get createdBy {
    return $CreatedByCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get modifiedBy {
    if (_value.modifiedBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.modifiedBy!, (value) {
      return _then(_value.copyWith(modifiedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WastageTypeImplCopyWith<$Res>
    implements $WastageTypeCopyWith<$Res> {
  factory _$$WastageTypeImplCopyWith(
          _$WastageTypeImpl value, $Res Function(_$WastageTypeImpl) then) =
      __$$WastageTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      CreatedBy createdBy,
      CreatedBy? modifiedBy,
      String createdDate,
      String? modifiedDate,
      String name,
      double price,
      String description,
      String? icon,
      bool status});

  @override
  $CreatedByCopyWith<$Res> get createdBy;
  @override
  $CreatedByCopyWith<$Res>? get modifiedBy;
}

/// @nodoc
class __$$WastageTypeImplCopyWithImpl<$Res>
    extends _$WastageTypeCopyWithImpl<$Res, _$WastageTypeImpl>
    implements _$$WastageTypeImplCopyWith<$Res> {
  __$$WastageTypeImplCopyWithImpl(
      _$WastageTypeImpl _value, $Res Function(_$WastageTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdBy = null,
    Object? modifiedBy = freezed,
    Object? createdDate = null,
    Object? modifiedDate = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? icon = freezed,
    Object? status = null,
  }) {
    return _then(_$WastageTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WastageTypeImpl implements _WastageType {
  const _$WastageTypeImpl(
      {this.id = 0,
      this.createdBy = const CreatedBy(),
      this.modifiedBy,
      this.createdDate = '',
      this.modifiedDate,
      this.name = '',
      this.price = 0.0,
      this.description = '',
      this.icon,
      this.status = true});

  factory _$WastageTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WastageTypeImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final CreatedBy createdBy;
  @override
  final CreatedBy? modifiedBy;
  @override
  @JsonKey()
  final String createdDate;
  @override
  final String? modifiedDate;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String description;
  @override
  final String? icon;
  @override
  @JsonKey()
  final bool status;

  @override
  String toString() {
    return 'WastageType(id: $id, createdBy: $createdBy, modifiedBy: $modifiedBy, createdDate: $createdDate, modifiedDate: $modifiedDate, name: $name, price: $price, description: $description, icon: $icon, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WastageTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdBy, modifiedBy,
      createdDate, modifiedDate, name, price, description, icon, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WastageTypeImplCopyWith<_$WastageTypeImpl> get copyWith =>
      __$$WastageTypeImplCopyWithImpl<_$WastageTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WastageTypeImplToJson(
      this,
    );
  }
}

abstract class _WastageType implements WastageType {
  const factory _WastageType(
      {final int id,
      final CreatedBy createdBy,
      final CreatedBy? modifiedBy,
      final String createdDate,
      final String? modifiedDate,
      final String name,
      final double price,
      final String description,
      final String? icon,
      final bool status}) = _$WastageTypeImpl;

  factory _WastageType.fromJson(Map<String, dynamic> json) =
      _$WastageTypeImpl.fromJson;

  @override
  int get id;
  @override
  CreatedBy get createdBy;
  @override
  CreatedBy? get modifiedBy;
  @override
  String get createdDate;
  @override
  String? get modifiedDate;
  @override
  String get name;
  @override
  double get price;
  @override
  String get description;
  @override
  String? get icon;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$WastageTypeImplCopyWith<_$WastageTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
