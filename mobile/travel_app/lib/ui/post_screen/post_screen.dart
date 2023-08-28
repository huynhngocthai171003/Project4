import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/ipost_view_model.dart';
import 'package:travel_app/ui/profile_screen/profile_screen.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../create_post_screen/create_post_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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

  Future<void> doDelete(int id) async {
    try{await _iPostViewModel.deletePost(id);}catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 50.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(const ProfileScreen());
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
              padding: EdgeInsets.only(
                top: 20.h,
                right: 10.w,
                left: 10.w,
                bottom: 20.h,
              ),
              child: Consumer<IPostViewModel>(
                builder: (context, vm, child) {
                  return FutureBuilder<List<PostModelUI>>(
                    future: vm.getPost(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return snapshot.data!.isNotEmpty
                              ? Column(
                                  children: [
                                    ...vm.posts.map((item) {
                                      if (item.userId.id ==
                                          locator<GlobalData>()
                                              .currentUser!
                                              .id) {
                                        return buildImage(item);
                                      }
                                      return const Center(
                                          child: Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ));
                                    }).toList()
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CreatePostScreen());
        },
        backgroundColor: textColor,
        child: const Icon(
          Icons.add_a_photo,
          color: backgroundColor,
        ),
      ),
    );
  }

  Widget buildImage(PostModelUI item) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ClipOval(
                  child: Image.memory(
                    convertImage(item.image),
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  item.name,
                  style: TextStyle(
                      fontFamily: fontAbriFatface,
                      fontSize: 20.sp,
                      color: Colors.white,
                      letterSpacing: 2.sp),
                ),
              ],
            ),
            IconButton(
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        elevation: 0,
                        backgroundColor: const Color(0xFF1D3133),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: const Color(0XFF344A43), width: 5.sp)),
                        child: SizedBox(
                          height: 130.h,
                          width: 180.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/edit.png', // Replace with your custom image path
                                      width: 50
                                          .w, // Adjust the width of the image as needed
                                      height: 50
                                          .h, // Adjust the height of the image as needed
                                    ),
                                    // SizedBox(
                                    //   height: 170.h,
                                    // ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.sp,
                                        fontFamily: fontPoppins,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/input2.png', // Replace with your custom image path
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        elevation: 0,
                                        backgroundColor:
                                            const Color(0xFF1D3133),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: const Color(0XFF344A43),
                                                width: 5.sp)),
                                        child: SizedBox(
                                          height: 130.h,
                                          width: 180.w,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () async{
                                                    await doDelete(item.id!);
                                                    Get.to(const ProfileScreen());
                                                    Get.to(const PostScreen());
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2.sp,
                                                        fontFamily: fontPoppins,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/images/input2.png', // Replace with your custom image path
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2.sp,
                                                        fontFamily: fontPoppins,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/delete.png', // Replace with your custom image path
                                      width: 50
                                          .w, // Adjust the width of the image as needed
                                      height: 50
                                          .h, // Adjust the height of the image as needed
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.sp,
                                        fontFamily: fontPoppins,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 35.sp,
              ),
            ),
          ],
          // ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            height: 350.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.memory(
              convertImage(item.image),
              width: 350.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 15.h),
          child: Row(
            children: [
              Text(
                DateFormat('dd-MM-yyyy').format(item.postDate),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: fontPoppins,
                  color: textHintColor,
                  // Change the color to your desired style
                  fontWeight: FontWeight
                      .normal, // Change the style to your desired style
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 5.h),
          child: Row(
            children: [
              Text(
                '${item.status}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.sp,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 5.h),
          child: Row(
            children: [
              Text(
                '${item.hashtag}',
                style: TextStyle(
                  color: const Color.fromARGB(243, 215, 208, 182),
                  fontSize: 13.sp,
                  fontFamily: fontPoppins,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.sp,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 20.h,
          ), // Adjust the horizontal padding as needed
          child: Image.asset(
            'assets/images/input2.png', // Replace with your custom image path
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
