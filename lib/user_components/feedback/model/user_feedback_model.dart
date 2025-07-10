import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_feedback_model.freezed.dart';
part 'user_feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  factory FeedbackModel({
    @Default('') String name,
    @Default('') String userId,
    @Default('') String description, 
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}
