import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_service_model.freezed.dart';
part 'view_service_model.g.dart';

@freezed
class WastageResponse with _$WastageResponse {
  const factory WastageResponse({
    @Default([]) List<WastageItem> body,
    @Default('') String message,
    @Default(false) bool success,
    
  }) = _WastageResponse;

  factory WastageResponse.fromJson(Map<String, dynamic> json) => _$WastageResponseFromJson(json);
}

@freezed
class WastageItem with _$WastageItem {
  const factory WastageItem({
    @Default(0) int id,
    @Default(CreatedBy()) CreatedBy createdBy,
    CreatedBy? modifiedBy,
    @Default('') String createdDate,
    String? modifiedDate,
    @Default('') String name,
    @Default('') String weight,
    @Default(0.0) double price,
    String? address,
    String? location,
    @Default('') String longitude,
    String? latitude,
    String? status,
    String? categoryName,
    @Default('') String description,
    String? image,
    @Default(WastageType()) WastageType wastageType,
    CreatedBy? approvedBy,
    String? approvedDate,
  }) = _WastageItem;

  factory WastageItem.fromJson(Map<String, dynamic> json) => _$WastageItemFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String salt,
    @Default('') String username,
    @Default('') String password,
    @Default('') String email,
    String? address,
    String? mobileNo,
    String? profilePicture,
    String? role,
    @Default(false) bool blocked,
    @Default(false) bool status,
    @Default('') String createdDate,
    String? modifiedDate,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class WastageType with _$WastageType {
  const factory WastageType({
    @Default(0) int id,
    @Default(CreatedBy()) CreatedBy createdBy,
    CreatedBy? modifiedBy,
    @Default('') String createdDate,
    String? modifiedDate,
    @Default('') String name,
    @Default(0.0) double price,
    @Default('') String description,
    String? icon,
    @Default(true) bool status,
  }) = _WastageType;

  factory WastageType.fromJson(Map<String, dynamic> json) => _$WastageTypeFromJson(json);
}
