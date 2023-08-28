import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';

class MyTextFieldRegister extends StatelessWidget {
  final controller;
  final String label;
  final bool isObscureText;
  final bool valid;
  final IconData icon;
  final String? instruction;

  const MyTextFieldRegister(
      {super.key,
      required this.controller,
      required this.label,
      required this.isObscureText,
      required this.valid,
      required this.icon,
      this.instruction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 31.5.w),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextField(
            controller: controller,
            obscureText: isObscureText,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              label: Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              errorText: valid ? instruction : null,
              prefixIcon: Icon(
                icon,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}