import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/core/model_ui/company_model_UI.dart';

import 'role_model_UI.dart';

part 'account_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountModelUI {
  int id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? address;
  String? phone;
  String? avatar;
  String? verifyCode;
  String? token;
  int? totalInvite;
  int? coin;
  int? status;
  RoleModelUI? roleId;
  CompanyModelUI? companyId;

  AccountModelUI({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.address,
    this.phone,
    this.avatar,
    this.verifyCode,
    this.token,
    this.totalInvite,
    this.coin,
    this.status,
    this.roleId,
    this.companyId,
  });
  factory AccountModelUI.fromJson(Map<String, dynamic> json) =>
      _$AccountModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$AccountModelUIToJson(this);
}
