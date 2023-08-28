import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/core/model_ui/account_model_UI.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';

part 'booking_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingTourDto {
  int? id;
  ScheduleModelUI scheduleId;
  AccountModelUI userId;
  int adult;
  int children;
  int baby;
  int? senior;
  String? bookingDate;
  RegionModelUI regionId;
  BookingTourDto({
    this.senior,
    required this.id,
    required this.scheduleId,
    required this.userId,
    required this.adult,
    required this.children,
    required this.baby,
    this.bookingDate,
    required this.regionId,
  });

  factory BookingTourDto.fromJson(Map<String, dynamic> json) =>
      _$BookingTourDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BookingTourDtoToJson(this);
}
