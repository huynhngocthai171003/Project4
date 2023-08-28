import 'package:json_annotation/json_annotation.dart';
part 'base_api_dto.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseApiDto<T> {
  T? result;

  BaseApiDto({
    this.result,
  });

  factory BaseApiDto.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseApiDtoFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseApiDtoToJson<T>(this, toJsonT);
}