import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/account_model_UI.dart';
import 'package:travel_app/ui/account_screen/widget/text_field.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../../core/global/router.dart';
import '../../core/view_model/interfaces/iauth_view_model.dart';
import '../personal_screen/mofify_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController oldController;
  late TextEditingController newController;
  late TextEditingController confirmController;

  bool validOld = false;
  bool validNew = false;
  bool validConfirm = false;

  String instructOld = 'Password Wrong, please try again';
  String instructNew = 'as least 6 characters(uppercase,lowercase,digit)';
  String instructConfirm = 'Confirm Password is wrong';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldController = TextEditingController();
    newController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldController.dispose();
    newController.dispose();
    confirmController.dispose();
  }
  // SingingCharacter? _character = SingingCharacter.lafayette;

  Future<bool> doUpdate() async {
    try {
      var result = await getRestClient().changePassword(
          locator<GlobalData>().currentUser!.id,
          oldController.text,
          confirmController.text);
      if (result) {
        return true;
      } else {
        setState(() {
          validOld = true;
        });
      }
    } catch (ex) {
      setState(() {
        validOld = true;
      });
    }
    return false;
  }

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
                            Get.to(const ModifyScreen());
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
                  Padding(
                    padding: EdgeInsets.only(top: 35.h, right: 190.w),
                    child: Text(
                      "Old Password",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  AccountTextField(
                    controller: oldController,
                    label: 'Old Password',
                    valid: validOld,
                    isObscureText: true,
                    instructionText: instructOld,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h, right: 180.w),
                    child: Container(
                      child: Text(
                        "New Password",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: fontPoppins,
                            color: Colors.white,
                            letterSpacing: 2.sp),
                      ),
                    ),
                  ),
                  AccountTextField(
                    controller: newController,
                    label: 'New Password',
                    valid: validNew,
                    isObscureText: true,
                    instructionText: instructNew,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h, right: 140.w),
                    child: Container(
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: fontPoppins,
                            color: Colors.white,
                            letterSpacing: 2.sp),
                      ),
                    ),
                  ),
                  AccountTextField(
                      controller: confirmController,
                      label: 'Confirm Password',
                      valid: validConfirm,
                      isObscureText: true,
                      instructionText: instructConfirm),
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          oldController.text == ''
                              ? validOld = true
                              : validOld = false;
                          validNew = !RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                              .hasMatch(newController.text);
                          confirmController.text != newController.text
                              ? validConfirm = true
                              : validConfirm = false;
                        });

                        if (!validOld && !validNew && !validConfirm) {
                          doUpdate().then((value) {
                            if (value) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: const Color(0XFF344A43),
                                            width: 5.sp)),
                                    child: SizedBox(
                                      height: 350.h,
                                      width: 400.w,
                                      child: Column(children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.w, top: 20.h),
                                          child: Image.asset(
                                            'assets/images/icon_update.png',
                                            width: 180.w,
                                            height: 180.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.w, top: 20.h),
                                          child: Text(
                                            "Update Success",
                                            style: TextStyle(
                                              color: const Color(0XFF344A43),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2.sp,
                                              fontFamily: fontPoppins,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets
                                                      .symmetric(
                                                  horizontal:
                                                      30.0), // Điều chỉnh padding ngang để làm cho button dài hơn
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2.0),
                                              ),
                                              backgroundColor: Colors.white,
                                            ),
                                            child: Container(
                                              width:
                                                  150.0, // Điều chỉnh chiều dài của button
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () => Get.toNamed(
                                                      MyRouter.account),
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: fontPoppins,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  );
                                },
                              );
                            }
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 330.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor,
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                        ),
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.sp,
                          ),
                        ),
                      ),
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
