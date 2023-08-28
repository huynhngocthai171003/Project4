// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'payment_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentDto {
  int? id;
  double price;
  int status;
  String description;
  int userId;
  int bookingId;
  int paymentMethod;
  String date;
  PaymentDto({
    this.id,
    required this.price,
    required this.status,
    required this.description,
    required this.userId,
    required this.bookingId,
    required this.paymentMethod,
    required this.date,
  });

  factory PaymentDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDtoToJson(this);
}
