// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      type: json['type'] as String? ?? '',
      senderId: json['senderId'] as String? ?? '',
      receiverId: json['receiverId'] as String? ?? '',
      timeStamp: json['timeStamp'] as String? ?? '',
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'timeStamp': instance.timeStamp,
    };

_$NotificationsModelImpl _$$NotificationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationsModelImpl(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map(
                  (e) => NotificationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NotificationsModelImplToJson(
        _$NotificationsModelImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };
