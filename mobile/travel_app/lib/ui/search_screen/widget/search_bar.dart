import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/global/locator.dart';

Widget searchBar() {
  var account = locator<GlobalData>().currentUser;
  return Column(
    children: [
      Row(
        children: [
          Image.asset(
            "assets/images/preview.png",
            width: 50.w,
            height: 50.h,
          ),
          Column(
            children: [
              Text(
                "Wellcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontFamily: fontPoppins,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                account!.firstName!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: fontPoppins,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(
            "Search your dream destination",
            style: TextStyle(
              color: tHintColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: kPrimaryColor,
              size: 30.sp,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: tHintColor,
              width: 2.sp,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: tHintColor,
              width: 2.sp,
            ),
          ),
        ),
      ),
    ],
  );
}
