import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';

class CreateTourTextField extends StatelessWidget {
  final controller;
  final String label;
  final bool valid;

  const CreateTourTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: textColor, fontSize: 18.sp, letterSpacing: .5.sp),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff385756),
        errorText: valid ? 'Invalid $label' : null,
      ),
    );
  }
}
