import 'package:json_annotation/json_annotation.dart';

part 'access_token_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AccessToken {
  String token;
  final int id;

  AccessToken({
    required this.token,
    required this.id,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}