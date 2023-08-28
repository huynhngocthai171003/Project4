import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'company_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyModelUI {
  int id;
  String name;
  String logo;
  bool status;
  String address;
  double totalRevenue;
  String? termOfService;
  String? hotline;
  String? email;

  CompanyModelUI({
    required this.id,
    required this.name,
    required this.logo,
    required this.status,
    required this.address,
    required this.totalRevenue,
    required this.termOfService,
    required this.hotline,
    required this.email,
  });

  factory CompanyModelUI.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyModelUIToJson(this);
}
