import 'package:json_annotation/json_annotation.dart';
part 'role_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class RoleModelUI {
    int id;
    String name;
    String description;

    RoleModelUI({
      required this.id,
      required this.name,
      required this.description,
    });

  factory RoleModelUI.fromJson(Map<String, dynamic> json) =>
      _$RoleModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$RoleModelUIToJson(this);
}
