import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/ipost_view_model.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';

class PostSOthercreen extends StatefulWidget {
  const PostSOthercreen({super.key});

  @override
  State<PostSOthercreen> createState() => _PostSOthercreenState();
}

class _PostSOthercreenState extends State<PostSOthercreen> {
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
      appBar: AppBar(
        title: Text(
          'Explore Post',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.sp,
            fontFamily: fontPoppins,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                                  if (item.userId.id !=
                                      locator<GlobalData>().currentUser!.id) {
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
                                "",
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
