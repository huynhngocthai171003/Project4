// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModelUI _$TourModelUIFromJson(Map<String, dynamic> json) => TourModelUI(
      id: json['id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      discount: json['discount'] as int?,
      viewer: json['viewer'] as int?,
      isToppick: json['isToppick'] as bool?,
      rate: (json['rate'] as num?)?.toDouble(),
      image: json['image'] as String,
      regionId:
          RegionModelUI.fromJson(json['regionId'] as Map<String, dynamic>),
      companyId: json['companyId'] == null
          ? null
          : CompanyModelUI.fromJson(json['companyId'] as Map<String, dynamic>),
      tourCode: json['tourCode'] as String?,
    );

Map<String, dynamic> _$TourModelUIToJson(TourModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'discount': instance.discount,
      'viewer': instance.viewer,
      'isToppick': instance.isToppick,
      'rate': instance.rate,
      'image': instance.image,
      'regionId': instance.regionId.toJson(),
      'companyId': instance.companyId?.toJson(),
      'tourCode': instance.tourCode,
    };
