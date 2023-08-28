// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModelUI _$ScheduleModelUIFromJson(Map<String, dynamic> json) =>
    ScheduleModelUI(
      id: json['id'] as int,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      quantityPassenger: json['quantityPassenger'] as int?,
      quantityMin: json['quantityMin'] as int?,
      quantityMax: json['quantityMax'] as int?,
      price: (json['price'] as num).toDouble(),
      tourId: TourModelUI.fromJson(json['tourId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleModelUIToJson(ScheduleModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'quantityPassenger': instance.quantityPassenger,
      'quantityMin': instance.quantityMin,
      'quantityMax': instance.quantityMax,
      'price': instance.price,
      'tourId': instance.tourId.toJson(),
    };
