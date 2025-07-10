// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordResponseImpl _$$ResetPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordResponseImpl(
      body: json['body'] ?? '',
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );

Map<String, dynamic> _$$ResetPasswordResponseImplToJson(
        _$ResetPasswordResponseImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'success': instance.success,
    };
