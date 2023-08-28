import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/personal_screen/mofify_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';
import 'package:travel_app/ui/update_profile_screen/widget/profile_text_field.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../../core/global/router.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // SingingCharacter? _character = SingingCharacter.lafayette;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  bool validFirstName = false;
  bool validLastName = false;
  bool validEmail = false;
  bool validPhone = false;
  bool validAddress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();

    firstNameController.text = locator<GlobalData>().currentUser!.firstName!;
    lastNameController.text = locator<GlobalData>().currentUser!.lastName!;
    emailController.text = locator<GlobalData>().currentUser!.email!;
    phoneController.text = locator<GlobalData>().currentUser!.phone = '';
    addressController.text = locator<GlobalData>().currentUser!.address = '';
  }

  Future<bool> doUpdate() async {
    try {
      var user = locator<GlobalData>().currentUser;
      user?.firstName = firstNameController.text;
      user?.lastName = lastNameController.text;
      user?.email = emailController.text;
      user?.phone = phoneController.text;
      user?.address = addressController.text;
      var result = await getRestClient().updateProfile(user!);
      locator<GlobalData>().currentUser = result;
      return true;
    } catch (e) {
      return false;
    }
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
                          padding: EdgeInsets.only(left: 100.w, top: 1.h),
                          child: Text(
                            "Profile",
                            style: TextStyle(
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
                    padding: EdgeInsets.only(top: 10.h),
                    child: Stack(
                      alignment: Alignment.center,
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
                          padding: EdgeInsets.only(left: 80.w, bottom: 50.h),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: const Color.fromARGB(255, 147, 124, 60),
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 210.w),
                    child: Text(
                      "First Name",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  ProfileTextField(
                    controller: firstNameController,
                    label: "First Name",
                    valid: validFirstName,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 220.w),
                    child: Text(
                      "Last Name",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  ProfileTextField(
                    controller: lastNameController,
                    label: "Last Name",
                    valid: validLastName,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 270.w),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  ProfileTextField(
                    controller: emailController,
                    label: "Email",
                    valid: validEmail,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 180.w),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  ProfileTextField(
                    controller: phoneController,
                    label: "Phone Number",
                    valid: validPhone,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, right: 240.w),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: fontPoppins,
                          color: Colors.white,
                          letterSpacing: 2.sp),
                    ),
                  ),
                  ProfileTextField(
                    controller: addressController,
                    label: "Address",
                    valid: validAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          validFirstName = !RegExp(r"^[a-zA-Z]+$")
                              .hasMatch(firstNameController.text);
                          validLastName = !RegExp(r"^[a-zA-Z]+$")
                              .hasMatch(lastNameController.text);
                          validEmail = !RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text);

                          if (locator<GlobalData>().currentUser!.phone != '') {
                            validPhone = !RegExp(r"^[0-9]{10,11}$")
                                .hasMatch(phoneController.text);
                          } else {
                            if (phoneController.text != '') {
                              validPhone = !RegExp(r"^[0-9]{10,11}$")
                                  .hasMatch(phoneController.text);
                            }
                          }

                          if (locator<GlobalData>().currentUser!.address != '') {
                            validAddress = !RegExp(r"^[A-Za-z0-9'\.\-\s\,]+$")
                                .hasMatch(addressController.text);
                          } else {
                            if (addressController.text != '') {
                              validAddress = !RegExp(r"^[A-Za-z0-9'\.\-\s\,]+$")
                                .hasMatch(addressController.text);
                            }
                          }

                        });

                        if (!validFirstName &&
                            !validLastName &&
                            !validAddress &&
                            !validEmail &&
                            !validPhone) {
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
                                                child: Text(
                                                  'Close',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: fontPoppins,
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
                          "Update",
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
                  SizedBox(
                    height: 20.h,
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
