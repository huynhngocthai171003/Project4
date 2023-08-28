import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants.dart';

class TermOfServiceScreen extends StatelessWidget {
  const TermOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.w, top: 58.h, right: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 79.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: const Color(0xff254543),
                        ),
                        child: Image.asset("assets/images/term.png"),
                      ),
                      Column(
                        children: [
                          Text(
                            "Terms of Service",
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: fontAbriFatface,
                                color: Colors.white,
                                letterSpacing: 3.sp,
                                wordSpacing: 4.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Last updated July 2023",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: fontAbriFatface,
                                color: Colors.white,
                                letterSpacing: 2.sp,
                                wordSpacing: 3.sp),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: const Color(0xccCBD5E1),
                    height: 40.h,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "1. YOUR AGREEMENT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontPoppins,
                      ),
                    ),
                  ),
                  Text(
                    "By using this Site, you agree to be bound by, and to comply with, these Terms and Conditions. If you do not agree to these Terms and Conditions, please do not use this site.\n\nPLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at anytime. Unless otherwise indicated, amendments will become effective immediately. Please review these Terms and Conditions periodically. Your continued use of the Site following the posting of changes and/or modificaitons will consitute your acceptance of the revised Terms and Conditions and the reasonableness of the standards for notice of changes. For your information, this page was last updated as of the date at the top of these terms and conditions.",
                    style: TextStyle(
                      color: textHintColor,
                      fontSize: 15.sp,
                      fontFamily: fontPoppins,
                      letterSpacing: 1.sp,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2. PRIVACY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontPoppins,
                      ),
                    ),
                  ),
                  Text(
                    "Please review our Privacy Policy, which also governs your visit to this Site, to understand uor pratices.",
                    style: TextStyle(
                      color: textHintColor,
                      fontSize: 15.sp,
                      fontFamily: fontPoppins,
                      letterSpacing: 1.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
