import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_category_model.freezed.dart';
part 'waste_category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default([]) List<Item> body,
    String? message,
    @Default(false) bool success,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    @Default(0) int id,
    @Default(User()) User createdBy,
    User? modifiedBy,
     DateTime? createdDate,
    DateTime? modifiedDate,
    @Default('') String name,
    @Default(0.0) double price,
    @Default('') String description,
    String? icon,
    required bool status,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String username,
    @Default('') String salt,
    @Default('') String password,
    @Default('') String email,
    double? longitude,
    double? lattitude,
    String? address,
    @Default('') String role,
    @Default(false) bool blocked,
    String? phoneNo,
    @Default('') String mobileNo,
    @Default(false) bool status,
   DateTime? createdDate,
    DateTime? modifiedDate,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
