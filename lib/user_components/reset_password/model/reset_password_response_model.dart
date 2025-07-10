import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response_model.freezed.dart';
part 'reset_password_response_model.g.dart';

@freezed
class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    @Default('') body,
    @Default('') message,
    @Default(false) success,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}
