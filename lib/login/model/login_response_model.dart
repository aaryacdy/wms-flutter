import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @Default(Body()) Body body,
    @Default('') String message,
    @Default(false) bool success,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class Body with _$Body {
  const factory Body({
    @Default(0) int id,
    @Default('') String role,
    @Default('') String token,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}
