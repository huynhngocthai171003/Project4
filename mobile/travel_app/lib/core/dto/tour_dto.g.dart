// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTourDto _$CreateTourDtoFromJson(Map<String, dynamic> json) =>
    CreateTourDto(
      accommodation: json['accommodation'] as String,
      region: json['region'] as String,
      transport: json['transport'] as String,
      description: json['description'] as String,
      adult: json['adult'] as int,
      children: json['children'] as int,
      baby: json['baby'] as int,
      startdate: DateTime.parse(json['startdate'] as String),
      enddate: DateTime.parse(json['enddate'] as String),
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      userId: json['userId'] as int,
      tourguide: json['tourguide'] as bool,
      note: json['note'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$CreateTourDtoToJson(CreateTourDto instance) =>
    <String, dynamic>{
      'region': instance.region,
      'accommodation': instance.accommodation,
      'transport': instance.transport,
      'description': instance.description,
      'adult': instance.adult,
      'children': instance.children,
      'baby': instance.baby,
      'startdate': instance.startdate.toIso8601String(),
      'enddate': instance.enddate.toIso8601String(),
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'userId': instance.userId,
      'tourguide': instance.tourguide,
      'note': instance.note,
      'type': instance.type,
    };
