import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/verify.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35.w, top: 58.h, right: 35.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 170.h,
                      ),
                      Text(
                        "Verify Your \nIdentify",
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white,
                          fontFamily: fontAbriFatface,
                          letterSpacing: 2.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "We have just sent a verification to john@gmail.com",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontFamily: fontPoppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 73.h,
                            width: 49.w,
                            child: TextFormField(
                              onSaved: (pin1) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontFamily: fontPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 73.h,
                            width: 49.w,
                            child: TextFormField(
                              onSaved: (pin2) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontFamily: fontPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 73.h,
                            width: 49.w,
                            child: TextFormField(
                              onSaved: (pin3) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontFamily: fontPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 73.h,
                            width: 49.w,
                            child: TextFormField(
                              onSaved: (pin4) {},
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontFamily: fontPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.h, bottom: 60.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive the code ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: fontPoppins,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Resend code",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12.sp,
                                  fontFamily: fontPoppins,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(MyRouter.home);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 47.h,
                          width: 304.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor,
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                          ),
                          child: Text(
                            "Verification",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By registering you agree to our",
                            style: TextStyle(
                              fontFamily: fontPoppins,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.toNamed(MyRouter.term);
                            },
                            child: Text(
                              "Terms of Service",
                              style: TextStyle(
                                fontFamily: fontPoppins,
                                fontSize: 12.sp,
                                color: kPrimaryColor,
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
          ),
        ],
      ),
    );
  }
}
