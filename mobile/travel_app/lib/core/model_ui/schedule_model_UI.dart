// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';

part 'schedule_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleModelUI {
  int id;
  DateTime? startDate;
  DateTime? endDate;
  int? quantityPassenger;
  int? quantityMin;
  int? quantityMax;
  double price;
  TourModelUI tourId;
  ScheduleModelUI({
    required this.id,
    this.startDate,
    this.endDate,
    this.quantityPassenger,
    this.quantityMin,
    this.quantityMax,
    required this.price,
    required this.tourId,
  });

  factory ScheduleModelUI.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleModelUIToJson(this);
}
