// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      name: json['name'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
      'description': instance.description,
    };
