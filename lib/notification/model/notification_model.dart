import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel({
    @Default('') String title,
    @Default('') String body,
    @Default('') String type,
    @Default('') String senderId,
    @Default('') String receiverId,
    @Default('') String timeStamp,
    
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
class NotificationsModel with _$NotificationsModel {
  factory NotificationsModel({
    @Default([]) List<NotificationModel> notifications,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);
}
