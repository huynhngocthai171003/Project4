import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';

part 'address_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModelUI {
  int id;
  String name;
  RegionModelUI regionId;
  String description;

  AddressModelUI({
    required this.id,
    required this.name,
    required this.regionId,
    required this.description,
  });
  factory AddressModelUI.fromJson(Map<String, dynamic> json) =>
      _$AddressModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelUIToJson(this);
}