import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/model_ui/profile_model_UI.dart';
import 'package:travel_app/ui/create_post_screen/create_post_screen.dart';
import 'package:travel_app/ui/personal_screen/personal_screen.dart';
import 'package:travel_app/ui/post_screen/post_other_screen.dart';
import 'package:travel_app/ui/post_screen/post_screen.dart';
import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../../core/view_model/interfaces/ipost_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  late IPostViewModel _iPostViewModel;

  @override
  void initState() {
    _iPostViewModel = context.read<IPostViewModel>();
    _iPostViewModel.init();
    super.initState();
  }

  convertImage(String img) {
    return const Base64Decoder().convert(img);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 50.h),
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
              Container(
                height: 130.0.h,
                width: 130.0.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        locator<GlobalData>().currentUser!.avatar == null
                            ? 'assets/images/avatar_background.png'
                            : 'assets/images/profile.jpg',
                      ),
                    ),
                    border: Border.all(
                      color: const Color(0xFF233A3A),
                      width: 6.w,
                    )),
              ),
              Container(
                height: 60.h,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(locator<GlobalData>().currentUser!.firstName!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: fontAbriFatface,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.sp,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              8.0), // Adjust the horizontal padding as needed
                      child: Image.asset(
                        'assets/images/input.png', // Replace with your custom image path
                        width: 24.w, // Adjust the width of the image as needed
                        height:
                            24.h, // Adjust the height of the image as needed
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: fontAbriFatface,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.sp,
                        ),
                        children: [
                          TextSpan(
                            text: 'Posts',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: fontPoppins,
                              color: textColor,
                              // Change the color to your desired style
                              fontWeight: FontWeight
                                  .normal, // Change the style to your desired style
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 20.h), // Adjust the horizontal padding as needed
                child: Image.asset(
                  'assets/images/input2.png', // Replace with your custom image path
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(const PostSOthercreen());
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bio.png',
                    ),
                    Positioned(
                      top: 25.h,
                      left: 80.w,
                      child: Text(
                        'Travel wonder through the lens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const PostScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: tHintColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 7.h,
                        horizontal: 10.w,
                      ),
                      margin: EdgeInsets.only(
                        right: 10.w,
                        bottom: 5.h,
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<IPostViewModel>(
                builder: (context, vm, child) {
                  return FutureBuilder<List<PostModelUI>>(
                    future: vm.getPost(),
                    builder: (context, snapshot) {
                      final result = [];
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return snapshot.data!.isNotEmpty
                              ? Wrap(
                                  children: [
                                    Row(
                                      children: vm.posts.map((item) {
                                        if (item.userId.id ==
                                            locator<GlobalData>()
                                                .currentUser!
                                                .id) {
                                          result.add(item);
                                        }

                                        return const Center(
                                            child: Text(
                                          "",
                                        ));
                                      }).toList(),
                                    ),
                                    SizedBox(
                                      height: 370.h,
                                      child: GridView.count(
                                        crossAxisCount: 2,
                                        padding: const EdgeInsets.all(10.0),
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        children: [
                                          ...result
                                              .map((item) => buildImage(item))
                                              .toList()
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: Text(
                                    "You didn't post anything!",
                                  ),
                                );
                        default:
                          return Center(
                            child: SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(PostModelUI item) {
    return Image.memory(
      convertImage(item.image),
      width: 170,
      height: 180,
      fit: BoxFit.cover,
    );
  }
}
