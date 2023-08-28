// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModelUI _$CompanyModelUIFromJson(Map<String, dynamic> json) =>
    CompanyModelUI(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      status: json['status'] as bool,
      address: json['address'] as String,
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      termOfService: json['termOfService'] as String?,
      hotline: json['hotline'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CompanyModelUIToJson(CompanyModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'status': instance.status,
      'address': instance.address,
      'totalRevenue': instance.totalRevenue,
      'termOfService': instance.termOfService,
      'hotline': instance.hotline,
      'email': instance.email,
    };
