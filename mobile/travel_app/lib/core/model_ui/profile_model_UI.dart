// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
import 'package:uuid/uuid.dart';

class ProfileModelUI {
  var id = const Uuid().v4();
  // String text;
  String image;
  ProfileModelUI({
    // required this.text,
    required this.image,
  });
  static final List<ProfileModelUI> items = [
    ProfileModelUI(
      // text: "Explore the beauty in the country !",
      image: "assets/images/grid_img1.png",
    ),
    ProfileModelUI(
      // text: "Explore the beauty in the country !",
      image: "assets/images/grid_img2.png",
    ),
    ProfileModelUI(
      // text: "Let's make you dream travelc",
      image: "assets/images/grid_img3.png",
    ),
    ProfileModelUI(
      // text: "Let's make you dream travelc",
      image: "assets/images/grid_img4.png",
    ),
  ];
}
