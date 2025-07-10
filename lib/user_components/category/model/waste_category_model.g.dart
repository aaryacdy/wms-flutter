// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      body: (json['body'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'success': instance.success,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdBy: json['createdBy'] == null
          ? const User()
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
      modifiedBy: json['modifiedBy'] == null
          ? null
          : User.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String?,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'icon': instance.icon,
      'status': instance.status,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      salt: json['salt'] as String? ?? '',
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble(),
      lattitude: (json['lattitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      role: json['role'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      phoneNo: json['phoneNo'] as String?,
      mobileNo: json['mobileNo'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'salt': instance.salt,
      'password': instance.password,
      'email': instance.email,
      'longitude': instance.longitude,
      'lattitude': instance.lattitude,
      'address': instance.address,
      'role': instance.role,
      'blocked': instance.blocked,
      'phoneNo': instance.phoneNo,
      'mobileNo': instance.mobileNo,
      'status': instance.status,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
    };
