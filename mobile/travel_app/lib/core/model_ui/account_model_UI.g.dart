// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model_UI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModelUI _$AccountModelUIFromJson(Map<String, dynamic> json) =>
    AccountModelUI(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      verifyCode: json['verifyCode'] as String?,
      token: json['token'] as String?,
      totalInvite: json['totalInvite'] as int?,
      coin: json['coin'] as int?,
      status: json['status'] as int?,
      roleId: json['roleId'] == null
          ? null
          : RoleModelUI.fromJson(json['roleId'] as Map<String, dynamic>),
      companyId: json['companyId'] == null
          ? null
          : CompanyModelUI.fromJson(json['companyId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountModelUIToJson(AccountModelUI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'verifyCode': instance.verifyCode,
      'token': instance.token,
      'totalInvite': instance.totalInvite,
      'coin': instance.coin,
      'status': instance.status,
      'roleId': instance.roleId?.toJson(),
      'companyId': instance.companyId?.toJson(),
    };
