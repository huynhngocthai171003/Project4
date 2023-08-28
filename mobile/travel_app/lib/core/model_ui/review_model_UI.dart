// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: file_names
import 'package:uuid/uuid.dart';

class ReviewModelUI {
  var id = const Uuid().v4();
  // String text;
  // String image;
  String name;
  String content;
  double rate;
  String ava;
  List<String> imageList = [];
  bool showAllImages;

  ReviewModelUI({
    required this.name,
    required this.content,
    required this.ava,
    required this.rate,
    // required this.image,
    required this.imageList,
    this.showAllImages = false,
  });

  static List<String> getMergedImageList() {
    List<String> mergedImageList = [];
    items.forEach((review) {
      mergedImageList.addAll(review.imageList);
    });
    return mergedImageList;
  }

  static final List<ReviewModelUI> items = [
    ReviewModelUI(
        // text: "Explore the beauty in the country !",
        imageList: [
          'assets/images/onboard1.png',
          'assets/images/onboard2.png',
          'assets/images/onboard3.png',
          'assets/images/verify.png',
          'assets/images/post.png'
        ],
        name: 'Thinh',
        content: 'Nice',
        ava: 'assets/images/logo.png',
        rate: 3.0),
    ReviewModelUI(
        imageList: [
          'assets/images/onboard1.png',
          'assets/images/onboard2.png',
          'assets/images/onboard3.png',
          'assets/images/grid_img1.png'
        ],
        name: 'Thinh',
        content: 'Nice',
        ava: 'assets/images/logo.png',
        rate: 5.0),
    ReviewModelUI(
        // text: "Explore the beauty in the country !",
        imageList: [
          'assets/images/onboard1.png',
          'assets/images/onboard2.png',
          'assets/images/onboard3.png',
          'assets/images/verify.png',
          'assets/images/post.png'
        ],
        name: 'Thinh',
        content: 'Nice',
        ava: 'assets/images/logo.png',
        rate: 3.0),
  ];
}
