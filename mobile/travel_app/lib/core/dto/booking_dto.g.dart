// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingTourDto _$BookingTourDtoFromJson(Map<String, dynamic> json) =>
    BookingTourDto(
      senior: json['senior'] as int?,
      id: json['id'] as int?,
      scheduleId:
          ScheduleModelUI.fromJson(json['scheduleId'] as Map<String, dynamic>),
      userId: AccountModelUI.fromJson(json['userId'] as Map<String, dynamic>),
      adult: json['adult'] as int,
      children: json['children'] as int,
      baby: json['baby'] as int,
      bookingDate: json['bookingDate'] as String?,
      regionId:
          RegionModelUI.fromJson(json['regionId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingTourDtoToJson(BookingTourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleId': instance.scheduleId.toJson(),
      'userId': instance.userId.toJson(),
      'adult': instance.adult,
      'children': instance.children,
      'baby': instance.baby,
      'bookingDate': instance.bookingDate,
      'regionId': instance.regionId.toJson(),
      'senior':instance.senior,
    };
