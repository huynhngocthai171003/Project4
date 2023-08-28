import 'package:json_annotation/json_annotation.dart';
part 'region_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class RegionModelUI {
  int id;
  String nameArea;
  String? description;
  String? image;
  RegionModelUI({
    required this.id,
    required this.nameArea,
    required this.description,
    required this.image,
  });
  factory RegionModelUI.fromJson(Map<String, dynamic> json) =>
      _$RegionModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$RegionModelUIToJson(this);
  // static final List<RegionModelUI> items = [
  //   RegionModelUI(
  //     name: "Nha Trang",
  //     text: "15 things to do",
  //     image: 'assets/images/nhatrang.png',
  //     region: 3,
  //   ),
  //   RegionModelUI(
  //     name: "Da Nang",
  //     text: "15 things to do",
  //     image: 'assets/images/danang.png',
  //     region: 3,
  //   ),
  //   RegionModelUI(
  //     name: "Da Lat",
  //     text: "15 things to do",
  //     image: 'assets/images/dalat.png',
  //     region: 3,
  //   ),
  //   RegionModelUI(
  //     name: "Hue",
  //     text: "15 things to do",
  //     image: 'assets/images/hue.png',
  //     region: 3,
  //   ),
  //   RegionModelUI(
  //     name: "Phan Thiet",
  //     text: "15 things to do",
  //     image: 'assets/images/phanthiet.png',
  //     region: 3,
  //   ),
  //   RegionModelUI(
  //     name: "Tay Nguyen",
  //     text: "15 things to do",
  //     image: 'assets/images/taynguyen.png',
  //     region: 3,
  //   ),
  // ];
}
