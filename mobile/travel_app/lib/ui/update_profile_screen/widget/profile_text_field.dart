import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';

class ProfileTextField extends StatelessWidget {
  final controller;
  final String label;
  final bool valid;

  const ProfileTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: SizedBox(
        width: 330.w,
        height: 60.h,
        // height: 150.h,
        child: TextField(
          controller: controller,
          style: TextStyle(
            fontSize: 18.sp,
            color: const Color(0xF3E9DDB2),
          ),
          decoration: InputDecoration(
            filled: true,
            errorText: valid ? 'Invalid $label' : null,
            hintStyle: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xF3E9DDB2),
                letterSpacing: 2.sp),
            fillColor: const Color(0xFF233A3A),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: const Color(0xFFC1AC67), width: 2.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: const Color(0xFFC1AC67), width: 2.sp),
            ),
          ),
        ),
      ),
    );
  }
}
