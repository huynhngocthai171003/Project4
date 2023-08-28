import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/about_screen/about_screen.dart';
class AboutDetailtScreen extends StatefulWidget {
  const AboutDetailtScreen({super.key});

  @override
  State<AboutDetailtScreen> createState() => _AboutDetailtScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _AboutDetailtScreenState extends State<AboutDetailtScreen> {
  // SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D3133),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 20.h),
                    child: Row(
                      // padding: EdgeInsets.only(left: 35.w, top: 1.h, right: 35.w),
                      // child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(const AboutScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                      ],
                      // ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.h, right: 230.w),
                        child: Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: fontPoppins,
                              color: Colors.white,
                              letterSpacing: 2.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 30.w),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: fontPoppins,
                            color: Colors.white,
                            letterSpacing: 1.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 35.h, left: 30.w),
                            child: Text(
                              "Why should you choose TOUR VIET ?",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: fontPoppins,
                                  color: Colors.white,
                                  letterSpacing: 2.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, left: 30.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "TOUR VIET has a full international travel license & well-invested infrastructure such as means of transport (new cars & high-class canoes) and restaurants, a team of professional and dynamic tour guides.",
                                "TOUR VIET says NO to dumping, poor quality service. Because we understand that your time and experience are more valuable than money.",
                                "Coming to TOUR VIET, you will be assured because you have chosen the right to directly organize and bring you the most complete trip."
                              ].map((sentence) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.w, top: 10.h, right: 25.w),
                                  child: Text(
                                    "• $sentence",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: fontPoppins,
                                      color: Colors.white,
                                      letterSpacing: 1.sp,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
