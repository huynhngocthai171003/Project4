import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/view_model/interfaces/iauth_view_model.dart';
import 'package:travel_app/ui/about_screen/about_screen.dart';
import 'package:travel_app/ui/account_screen/account_screen.dart';
import 'package:travel_app/ui/home_screen/home_screen.dart';
import 'package:travel_app/ui/login_screen/register_screen.dart';
import 'package:travel_app/ui/profile_screen/profile_screen.dart';
import 'package:travel_app/ui/setting_screen/setting_screen.dart';
import 'package:travel_app/ui/update_profile_screen/update_profile_screen.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import 'mofify_screen.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff1D3133),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 5.h),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(const HomeScreen());
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, top: 5.h),
                    child: Container(
                      child: Row(
                        // padding: EdgeInsets.only(left: 35.w, top: 1.h, right: 35.w),
                        // child: Row(
                        children: [
                          locator<GlobalData>().currentUser!.avatar == null
                              ? ClipOval(
                                  child: Image.asset(
                                    'assets/images/avatar_background.png',
                                    width: 90.w,
                                    height: 90.h,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile.jpg',
                                    width: 90.w,
                                    height: 90.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              locator<GlobalData>().currentUser!.firstName!,
                              style: TextStyle(
                                  fontFamily: fontAbriFatface,
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  letterSpacing: 2.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 93.w),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(const SettingScreen());
                                  },
                                  icon: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: 35.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        // ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, top: 20.h),
                    child: locator<GlobalData>().currentUser!.phone != null ? Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment
                      //         .spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // _authViewModel.logout();
                          },
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xffD6A268),
                            size: 30.sp,
                          ),
                        ),
                        // SizedBox(
                        //   height: 170.h,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, top: 0.h),
                          child: Text(
                            locator<GlobalData>().currentUser!.phone!,
                            style: TextStyle(
                              color: Color.fromARGB(255, 158, 157, 156),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.sp,
                              fontFamily: fontPoppins,
                            ),
                          ),
                        ) ,
                      ],
                    ): const Text(''),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, top: 5.h),
                    child: Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment
                      //         .spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Get.to(const ());
                          },
                          icon: Icon(
                            Icons.email,
                            color: const Color(0xffD6A268),
                            size: 30.sp,
                          ),
                        ),
                        // SizedBox(
                        //   height: 170.h,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, top: 0.h),
                          child: Text(
                            locator<GlobalData>().currentUser!.email!,
                            style: TextStyle(
                              color: Color.fromARGB(255, 158, 157, 156),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.sp,
                              fontFamily: fontPoppins,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 7.h), // Adjust the horizontal padding as needed
                    child: Image.asset(
                      'assets/images/input2.png', // Replace with your custom image path
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      top: 10.h,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(const ProfileScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                    color: textColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.sp,
                                      fontFamily: fontPoppins,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(const UpdateProfileScreen());
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white60,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const ModifyScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.manage_accounts,
                                    color: textColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Account infomation",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.sp,
                                      fontFamily: fontPoppins,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(const ModifyScreen());
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white60,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const AboutScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.library_books,
                                    color: textColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "About",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.sp,
                                      fontFamily: fontPoppins,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(const AboutScreen());
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white60,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<IAuthViewModel>().logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.sp,
                                      fontFamily: fontPoppins,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<IAuthViewModel>().logout();
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: backgroundColor,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/help.png',
                        ),
                        Positioned(
                          top: 15.h,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 120.w,
                              top: 30.h,
                            ),
                            child: Text(
                              'How can we help you?',
                              style: TextStyle(
                                // fontFamily: fontBills,
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
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
