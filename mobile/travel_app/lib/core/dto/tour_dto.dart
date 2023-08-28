import 'package:json_annotation/json_annotation.dart';

part 'tour_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTourDto {
  String region;
  String accommodation;
  String transport;
  String description;
  int adult;
  int children;
  int baby;
  DateTime startdate;
  DateTime enddate;
  String fullname;
  String email;
  String phone;
  String address;
  int userId;
  bool tourguide;
  String note;
  String type;

  CreateTourDto({
    required this.accommodation,
    required this.region,
    required this.transport,
    required this.description,
    required this.adult,
    required this.children,
    required this.baby,
    required this.startdate,
    required this.enddate,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.userId,
    required this.tourguide,
    required this.note,
    required this.type,
  });

  factory CreateTourDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTourDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTourDtoToJson(this);
}
