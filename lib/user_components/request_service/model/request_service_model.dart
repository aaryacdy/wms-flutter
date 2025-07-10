import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'request_service_model.freezed.dart';
part 'request_service_model.g.dart';

@freezed
class RequestServiceModel with _$RequestServiceModel {
  factory RequestServiceModel({
    @Default('') String categoryId,
    @Default('') String userId,
    @Default('') String name,
    @Default('') String weight,
    @Default('') String price,
    @Default('') String longitude,
    @Default('') String latitude,
    @Default('') String description,
   // XFile? attachment,
    @Default('') String id,
  }) = _RequestServiceModel;

  factory RequestServiceModel.fromJson(Map<String, dynamic> json) =>
      _$RequestServiceModelFromJson(json);
}
