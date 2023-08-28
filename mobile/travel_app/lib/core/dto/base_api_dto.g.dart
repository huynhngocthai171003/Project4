// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseApiDto<T> _$BaseApiDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseApiDto<T>(
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
    );

Map<String, dynamic> _$BaseApiDtoToJson<T>(
  BaseApiDto<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'result': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
