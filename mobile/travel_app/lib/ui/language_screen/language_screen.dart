import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/setting_screen/setting_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

enum SingingCharacter { vietnamese, english }

class _LanguageScreenState extends State<LanguageScreen> {
  SingingCharacter? _character = SingingCharacter.vietnamese;

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
                            Get.to(const SettingScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 1.h),
                          child: Text(
                            "Choose your Language",
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
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        // mainAxisAlignment:
                        //     MainAxisAlignment
                        //         .spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0
                                    .w), // Adjust the horizontal padding as needed
                            child: Image.asset(
                              'assets/images/vn.png', // Replace with your custom image path
                              width: 50
                                  .w, // Adjust the width of the image as needed
                              height: 50
                                  .h, // Adjust the height of the image as needed
                            ),
                          ),
                          // SizedBox(
                          //   height: 170.h,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.w, top: 0.h),
                            child: Text(
                              "Vietnamese",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.sp,
                                fontFamily: fontPoppins,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 100.w),
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.vietnamese,
                              groupValue: _character,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFC1AC67)),
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        // mainAxisAlignment:
                        //     MainAxisAlignment
                        //         .spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0
                                    .w), // Adjust the horizontal padding as needed
                            child: Image.asset(
                              'assets/images/english.png', // Replace with your custom image path
                              width: 50
                                  .w, // Adjust the width of the image as needed
                              height: 50
                                  .h, // Adjust the height of the image as needed
                            ),
                          ),
                          // SizedBox(
                          //   height: 170.h,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.w, top: 0.h),
                            child: Text(
                              "English",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.sp,
                                fontFamily: fontPoppins,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 150.w),
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.english,
                              groupValue: _character,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFC1AC67)),
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
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
