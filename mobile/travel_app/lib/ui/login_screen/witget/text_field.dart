import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String label;
  final bool isObscureText;
  final bool valid;

  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isObscureText,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 31.5.w),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
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
              errorText: valid ? "Invalid $label" : null,
              prefixIcon: Icon(
                isObscureText ? Icons.lock : Icons.email_outlined,
                color: kPrimaryColor,
              ),
            ),
          ),
          if (isObscureText)
            InkWell(
              onTap: () {},
              child: Text(
                "Forgot ?",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
