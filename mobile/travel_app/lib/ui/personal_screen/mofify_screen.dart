import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app/ui/account_screen/account_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';

import '../../constants.dart';
import '../update_profile_screen/update_profile_screen.dart';

class ModifyScreen extends StatefulWidget {
  const ModifyScreen({super.key});

  @override
  State<ModifyScreen> createState() => _ModifyScreenState();
}

class _ModifyScreenState extends State<ModifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: backgroundColor,
      //   title: Text(
      //     'Update infomation',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20.sp,
      //       fontWeight: FontWeight.w500,
      //       letterSpacing: 1.sp,
      //       fontFamily: fontPoppins,
      //     ),
      //   ),
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 40.h),
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
                        "Account",
                        style: TextStyle(
                          // ignore: use_full_hex_values_for_flutter_colors
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
                onTap: () => {Get.to(const UpdateProfileScreen())},
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Update infomation",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.sp,
                            letterSpacing: 1.sp,
                            fontFamily: fontPoppins,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white60,
                        size: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0.w, right: 0.w),
                child: Divider(
                  color: tHintColor,
                  height: 10.h,
                  thickness: 2.w,
                ),
              ),
              InkWell(
                onTap: () => {Get.to(const AccountScreen())},
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.sp,
                            letterSpacing: 1.sp,
                            fontFamily: fontPoppins,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white60,
                        size: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0.w, right: 0.w),
                child: Divider(
                  color: tHintColor,
                  height: 10.h,
                  thickness: 2.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
