// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/about_screen/about_detail_screen.dart';
import 'package:travel_app/ui/notification_screen/notification_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';
import 'package:travel_app/ui/term_service_screen/term_of_service_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreentate();
}

enum SingingCharacter { lafayette, jefferson }

class _AboutScreentate extends State<AboutScreen> {
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
                            Get.to(const PersonalScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80.w, top: 1.h),
                          child: Text(
                            "About Us",
                            style: TextStyle(
                              color: const Color(0xFFF3E9DDB2),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.sp,
                              fontFamily: fontPoppins,
                            ),
                          ),
                        ),
                      ],
                      // ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const AboutDetailtScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.h, right: 230.w),
                      child: Text(
                        "About Us",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: fontPoppins,
                            color: Colors.white,
                            letterSpacing: 2.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: 330.w,
                    padding: EdgeInsets.only(
                        top: 20.h), // Adjust the horizontal padding as needed
                    child: Image.asset(
                      'assets/images/input2.png', // Replace with your custom image path
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const TermOfServiceScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.h, right: 120.w),
                      child: Text(
                        "Term and Condition",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: fontPoppins,
                            color: Colors.white,
                            letterSpacing: 2.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: 330.w,
                    padding: EdgeInsets.only(
                        top: 20.h), // Adjust the horizontal padding as needed
                    child: Image.asset(
                      'assets/images/input2.png', // Replace with your custom image path
                    ),
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
