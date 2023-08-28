// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
import 'package:uuid/uuid.dart';

class OnboardModelUI {
  var id = const Uuid().v4();
  String text;
  String image;
  OnboardModelUI({
    required this.text,
    required this.image,
  });
  static final List<OnboardModelUI> items = [
    OnboardModelUI(
      text: "Explore the beauty in the country !",
      image: "assets/images/onboard1.png",
    ),
    OnboardModelUI(
      text: "Explore the beauty in the country !",
      image: "assets/images/onboard2.png",
    ),
    OnboardModelUI(
      text: "Let's make you dream travelc",
      image: "assets/images/onboard3.png",
    ),
  ];
}
