// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      body: json['body'] == null
          ? const Body()
          : Body.fromJson(json['body'] as Map<String, dynamic>),
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'success': instance.success,
    };

_$BodyImpl _$$BodyImplFromJson(Map<String, dynamic> json) => _$BodyImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      role: json['role'] as String? ?? '',
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$$BodyImplToJson(_$BodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'token': instance.token,
    };
