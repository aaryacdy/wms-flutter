// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WastageResponseImpl _$$WastageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WastageResponseImpl(
      body: (json['body'] as List<dynamic>?)
              ?.map((e) => WastageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$WastageResponseImplToJson(
        _$WastageResponseImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'success': instance.success,
    };

_$WastageItemImpl _$$WastageItemImplFromJson(Map<String, dynamic> json) =>
    _$WastageItemImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdBy: json['createdBy'] == null
          ? const CreatedBy()
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      modifiedBy: json['modifiedBy'] == null
          ? null
          : CreatedBy.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      createdDate: json['createdDate'] as String? ?? '',
      modifiedDate: json['modifiedDate'] as String?,
      name: json['name'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] as String?,
      location: json['location'] as String?,
      longitude: json['longitude'] as String? ?? '',
      latitude: json['latitude'] as String?,
      status: json['status'] as String?,
      categoryName: json['categoryName'] as String?,
      description: json['description'] as String? ?? '',
      image: json['image'] as String?,
      wastageType: json['wastageType'] == null
          ? const WastageType()
          : WastageType.fromJson(json['wastageType'] as Map<String, dynamic>),
      approvedBy: json['approvedBy'] == null
          ? null
          : CreatedBy.fromJson(json['approvedBy'] as Map<String, dynamic>),
      approvedDate: json['approvedDate'] as String?,
    );

Map<String, dynamic> _$$WastageItemImplToJson(_$WastageItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'name': instance.name,
      'weight': instance.weight,
      'price': instance.price,
      'address': instance.address,
      'location': instance.location,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'status': instance.status,
      'categoryName': instance.categoryName,
      'description': instance.description,
      'image': instance.image,
      'wastageType': instance.wastageType,
      'approvedBy': instance.approvedBy,
      'approvedDate': instance.approvedDate,
    };

_$CreatedByImpl _$$CreatedByImplFromJson(Map<String, dynamic> json) =>
    _$CreatedByImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      salt: json['salt'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String?,
      mobileNo: json['mobileNo'] as String?,
      profilePicture: json['profilePicture'] as String?,
      role: json['role'] as String?,
      blocked: json['blocked'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      createdDate: json['createdDate'] as String? ?? '',
      modifiedDate: json['modifiedDate'] as String?,
    );

Map<String, dynamic> _$$CreatedByImplToJson(_$CreatedByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'salt': instance.salt,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'address': instance.address,
      'mobileNo': instance.mobileNo,
      'profilePicture': instance.profilePicture,
      'role': instance.role,
      'blocked': instance.blocked,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
    };

_$WastageTypeImpl _$$WastageTypeImplFromJson(Map<String, dynamic> json) =>
    _$WastageTypeImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdBy: json['createdBy'] == null
          ? const CreatedBy()
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      modifiedBy: json['modifiedBy'] == null
          ? null
          : CreatedBy.fromJson(json['modifiedBy'] as Map<String, dynamic>),
      createdDate: json['createdDate'] as String? ?? '',
      modifiedDate: json['modifiedDate'] as String?,
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String?,
      status: json['status'] as bool? ?? true,
    );

Map<String, dynamic> _$$WastageTypeImplToJson(_$WastageTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'icon': instance.icon,
      'status': instance.status,
    };
