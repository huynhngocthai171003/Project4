import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/core/model_ui/company_model_UI.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
part 'tour_model_UI.g.dart';

@JsonSerializable(explicitToJson: true)
class TourModelUI {
  int id;
  String? name;
  String? description;
  int? discount;
  int? viewer;
  bool? isToppick;
  double? rate;
  String image;
  RegionModelUI regionId;
  // transportId
  // guideId
  CompanyModelUI? companyId;
  String? tourCode;
  TourModelUI(
      {required this.id,
      required this.name,
      required this.description,
      required this.discount,
      this.viewer,
      required this.isToppick,
      required this.rate,
      required this.image,
      required this.regionId,
      this.companyId,
      this.tourCode});
  factory TourModelUI.fromJson(Map<String, dynamic> json) =>
      _$TourModelUIFromJson(json);
  Map<String, dynamic> toJson() => _$TourModelUIToJson(this);
  static final List<TourModelUI> items = [
    // TourModelUI(
    //   id: 1,
    //   name: 'Tour Nha Trang | Hon Lao - Doc Let - I Resort -Vien Hai Duong Hoc',
    //   description:
    //       "- Nha Trang is a famous coastal city in Vietnam, attracting visitors by its long coastline and fine white sand. \n- A special feature of Nha Trang is the rich coral forest, attracting those who love scuba diving and exploring the ocean. In addition, Nha Trang is also famous for its diverse cuisine and fresh seafood specialties. \n- Guests can enjoy dishes such as grilled spring rolls, Nha Trang fish balls and fish noodle soup. With beautiful natural landscapes and many interesting activities, Nha Trang is the ideal destination for those who want to enjoy the beach and explore the country's diverse culture.",
    //   // price: 186.04,
    //   discount: 12,
    //   viewer: 0,
    //   isToppick: true,
    //   rate: 4.0,
    //   images: "assets/images/tour_nha_trang.png",
    //   regionId: 1,
    // ),
    // TourModelUI(
    //   id: 2,
    //   name: 'Tour Nha Trang | Hon Lao - Doc Let - I Resort -Vien Hai Duong Hoc',
    //   description:
    //       "Nha Trang is a famous coastal city in Vietnam, attracting visitors by its long coastline and fine white sand. A special feature of Nha Trang is the rich coral forest, attracting those who love scuba diving and exploring the ocean. In addition, Nha Trang is also famous for its diverse cuisine and fresh seafood specialties. Guests can enjoy dishes such as grilled spring rolls, Nha Trang fish balls and fish noodle soup. With beautiful natural landscapes and many interesting activities, Nha Trang is the ideal destination for those who want to enjoy the beach and explore the country's diverse culture.",
    //   discount: 12,
    //   viewer: 0,
    //   isToppick: true,
    //   rate: 4.0,
    //   images: "assets/images/tour_nha_trang.png",
    //   regionId: 1,
    // ),
    // TourModelUI(
    //   id: 3,
    //   name: 'Tour Nha Trang | Hon Lao - Doc Let - I Resort -Vien Hai Duong Hoc',
    //   description:
    //       "Nha Trang is a famous coastal city in Vietnam, attracting visitors by its long coastline and fine white sand. A special feature of Nha Trang is the rich coral forest, attracting those who love scuba diving and exploring the ocean. In addition, Nha Trang is also famous for its diverse cuisine and fresh seafood specialties. Guests can enjoy dishes such as grilled spring rolls, Nha Trang fish balls and fish noodle soup. With beautiful natural landscapes and many interesting activities, Nha Trang is the ideal destination for those who want to enjoy the beach and explore the country's diverse culture.",
    //   // price: 186.04,
    //   discount: 12,
    //   viewer: 0,
    //   isToppick: true,
    //   rate: 4.0,
    //   images: "assets/images/tour_nha_trang.png",
    //   regionId: 1,
    // ),
  ];
}
