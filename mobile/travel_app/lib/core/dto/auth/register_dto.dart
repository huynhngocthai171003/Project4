import 'package:json_annotation/json_annotation.dart';
part 'register_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterDto {
  String firstName;
  String lastName;
  String email;
  String password;
  int roleId;
  int status;

  RegisterDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.roleId,
    required this.status,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
