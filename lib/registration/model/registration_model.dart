import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
class RegistrationModel with _$RegistrationModel {
  factory RegistrationModel({
    @Default('') String name,
    @Default('') String username,
    @Default('') String email,
    @Default('') String password,
    @Default('') String mobileNo,
    @Default('') String address,
    @Default('') String role,
    
    
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}
