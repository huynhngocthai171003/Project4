// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModelUI _$RegionModelUIFromJson(Map<String, dynamic> json) =>
    RegionModelUI(
      id: json['id'] as int,
      nameArea: json['nameArea'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$RegionModelUIToJson(RegionModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameArea': instance.nameArea,
      'description': instance.description,
      'image': instance.image,
    };
