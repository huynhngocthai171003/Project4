import 'package:uuid/uuid.dart';

class LocationModelUI {
  var id = const Uuid().v4();
  String title;
  String image;
  bool favorite;
  double rate;
  String area;
  String name;
  LocationModelUI({
    required this.title,
    required this.image,
    required this.favorite,
    required this.rate,
    required this.area,
    required this.name,
  });
  static final List<LocationModelUI> locations = [
    LocationModelUI(
      title: "Explore the beauty in the country !",
      image: "assets/images/location2.png",
      favorite: false,
      rate: 4.0,
      area: "Hue",
      name: "Pho Co Hoi An",
    ),
    LocationModelUI(
      title: "Explore the beauty in the country !",
      image: "assets/images/location1.png",
      favorite: false,
      rate: 4.0,
      area: "Hue",
      name: "Pho Co Hoi An",
    ),
    LocationModelUI(
      title: "Explore the beauty in the country !",
      image: "assets/images/location1.png",
      favorite: false,
      rate: 4.0,
      area: "Hue",
      name: "Pho Co Hoi An",
    ),
  ];
}
