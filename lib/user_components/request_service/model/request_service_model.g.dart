// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestServiceModelImpl _$$RequestServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestServiceModelImpl(
      categoryId: json['categoryId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
      price: json['price'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestServiceModelImplToJson(
        _$RequestServiceModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'userId': instance.userId,
      'name': instance.name,
      'weight': instance.weight,
      'price': instance.price,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'description': instance.description,
      'id': instance.id,
    };
