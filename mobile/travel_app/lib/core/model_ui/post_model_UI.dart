import 'package:json_annotation/json_annotation.dart';
import 'account_model_UI.dart';
part 'post_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class PostModelUI {
  int? id;
  String image;
  String name;
  String? status;
  DateTime postDate;
  String? hashtag;
  AccountModelUI userId;
  PostModelUI({
    this.id,
    required this.image,
    required this.name,
    this.status,
    required this.postDate,
    this.hashtag,
    required this.userId,
  });

  factory PostModelUI.fromJson(Map<String, dynamic> json) =>
      _$PostModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelUIToJson(this);
}
