// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModelUI _$AddressModelUIFromJson(Map<String, dynamic> json) =>
    AddressModelUI(
      id: json['id'] as int,
      name: json['name'] as String,
      regionId:
          RegionModelUI.fromJson(json['regionId'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$AddressModelUIToJson(AddressModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'regionId': instance.regionId.toJson(),
      'description': instance.description,
    };
