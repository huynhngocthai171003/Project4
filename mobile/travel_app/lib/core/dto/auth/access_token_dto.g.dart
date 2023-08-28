// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      token: json['token'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
    };
