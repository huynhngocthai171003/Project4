// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/language_screen/language_screen.dart';
import 'package:travel_app/ui/notification_screen/notification_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _SettingScreenState extends State<SettingScreen> {
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
                          padding: EdgeInsets.only(left: 100.w, top: 1.h),
                          child: Text(
                            "Setting",
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
                      Get.to(const LanguageScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.h, right: 190.w),
                      child: Text(
                        "App language",
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
                      Get.to(const NotificationScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 35.h, right: 210.w),
                      child: Text(
                        "Notification",
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
