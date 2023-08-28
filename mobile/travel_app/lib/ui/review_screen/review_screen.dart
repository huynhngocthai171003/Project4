import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/review_model_UI.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _ReviewScreenState extends State<ReviewScreen> with SingleTickerProviderStateMixin {
  bool zoom = false;
  late TabController tabController;
  final List<ReviewModelUI> items = ReviewModelUI.items;
  List<String> mergedImageList = ReviewModelUI.getMergedImageList();

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  // SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff1D3133),
      body: Column(
        children: [
                    Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 20.w, right: 20.w),
                child: Text(
                  "Tour Nha Trang | Hon Lao - Doc Let - I Resort - Vien Hai Duong Hoc",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: fontAbriFatface,
                      color: Colors.white,
                      letterSpacing: 2.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, right: 150.w),
                  child: SizedBox(
                    width: 300,
                    child: TabBar(
                      // indicatorWeight: 2.sp,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: const EdgeInsets.only(top: 10.0),
                      labelColor: const Color(0xFFD6A268),
                      indicatorColor: const Color(0xFFD6A268),
                      unselectedLabelColor: Colors.white,
                      controller: tabController,
                      tabs: const [
                        Text('Review'),
                        Text('Gallery'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            // child: ListView(
            //   children: [
            child: Container(
              padding: EdgeInsets.only(top: 0.h),
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...items.map((item) => buildImage(item)).toList(),
                      ],
                    ),
                  ),
                  // SingleChildScrollView(
                  //   child: Container(
                  //     child:

                  MasonryGridView.builder(
                    itemCount: mergedImageList.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      String imageUrl = mergedImageList[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          imageUrl,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Color.fromARGB(255, 136, 30, 22),
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container(); // Return a default widget here or any other appropriate widget.
                        }
                      },
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
                      child: SizedBox(
                        width: 290.w,
                        height: 50.h,
                        // height: 150.h,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xF3E9DDB2),
                          ),
                          decoration: InputDecoration(
                            hintText: 'write a comment',
                            filled: true,
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xF3E9DDB2),
                                letterSpacing: 2.sp),
                            fillColor: const Color(0xFF233A3A),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: const Color(0xFFC1AC67), width: 2.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: const Color(0xFFC1AC67), width: 2.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
      //   ),
      // ),
    );
  }

  Widget buildImage(ReviewModelUI item) {
    return Align(
      // alignment: Alignment.topLeft,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: GestureDetector(
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      item.ava,
                      width: 50.w,
                      height: 50.h,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontFamily: fontAbriFatface,
                        fontSize: 20.sp,
                        color: Colors.white,
                        letterSpacing: 2.sp,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 120.w),
                      child: Container(
                        width: 80.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6A268),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              item.rate.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
              // child: ListView.builder(
              //   itemCount: item.imageList.length,
              //   itemBuilder: (context, index) {
              //     return
              child: Wrap(
                children: [
                  ...item.imageList
                      .take(item.showAllImages ? item.imageList.length : 3)
                      .map((imagePath) => GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Hero(
                                      tag: "preview",
                                      child: Image(
                                        image: AssetImage(imagePath),
                                        height: 550.h,
                                        width: 350.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover,
                                  height: 80.h,
                                  width: 60.w,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  SizedBox(
                    width: 20.sp,
                  ),
                  if (item.imageList.length > 3)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          item.showAllImages = !item.showAllImages;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Icon(
                          item.showAllImages
                              ? Icons.arrow_upward
                              : Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              )
              //   },
              // ),
              ),
          Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 20.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.content,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: fontPoppins,
                        fontSize: 13.sp,
                        color: Colors.white,
                        letterSpacing: 2.sp,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
