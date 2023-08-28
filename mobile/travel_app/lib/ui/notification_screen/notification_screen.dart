import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/setting_screen/setting_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _NotificationScreenState extends State<NotificationScreen> {
  bool email = false;
  bool update = false;
  bool re = false;
  bool mess = false;

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
                            Get.to(const SettingScreen());
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70.w, top: 1.h),
                          child: Text(
                            "Notification",
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
                    padding: EdgeInsets.only(top: 35.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            "Email Notification",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: fontPoppins,
                                color: Colors.white,
                                letterSpacing: 2.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80.w),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  email =
                                      !email; // Chuyển đổi trạng thái khi nút được nhấn
                                });
                              },
                              child: Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color:
                                      email ? const Color(0xFFC1AC67) : Colors.grey,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: email ? 30.0 : 0.0,
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            "Apps Update",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: fontPoppins,
                                color: Colors.white,
                                letterSpacing: 2.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 130.w),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  update =
                                      !update; // Chuyển đổi trạng thái khi nút được nhấn
                                });
                              },
                              child: Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color:
                                      update ? const Color(0xFFC1AC67) : Colors.grey,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: update ? 30.0 : 0.0,
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            "Recommendation",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: fontPoppins,
                                color: Colors.white,
                                letterSpacing: 2.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 85.w),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  re =
                                      !re; // Chuyển đổi trạng thái khi nút được nhấn
                                });
                              },
                              child: Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: re ? const Color(0xFFC1AC67) : Colors.grey,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: re ? 30.0 : 0.0,
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            "Messages",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: fontPoppins,
                                color: Colors.white,
                                letterSpacing: 2.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 160.w),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) =>
                                ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  mess =
                                      !mess; // Chuyển đổi trạng thái khi nút được nhấn
                                });
                              },
                              child: Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: mess ? const Color(0xFFC1AC67) : Colors.grey,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: mess ? 30.0 : 0.0,
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
