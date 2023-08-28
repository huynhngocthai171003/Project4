// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) => PaymentDto(
      id: json['id'] as int?,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as int,
      description: json['description'] as String,
      userId: json['userId'] as int,
      bookingId: json['bookingId'] as int,
      paymentMethod: json['paymentMethod'] as int,
      date: json['date'] as String,
    );

Map<String, dynamic> _$PaymentDtoToJson(PaymentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'status': instance.status,
      'description': instance.description,
      'userId': instance.userId,
      'bookingId': instance.bookingId,
      'paymentMethod': instance.paymentMethod,
      'date': instance.date,
    };
