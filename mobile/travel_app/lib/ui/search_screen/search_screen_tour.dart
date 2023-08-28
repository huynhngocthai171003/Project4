import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';
import 'package:travel_app/ui/common_widgets/custom_bottom_navigation.dart';
import 'package:travel_app/ui/search_screen/widget/search_bar.dart';

class SearchTourScreen extends StatefulWidget {
  final int item;
  const SearchTourScreen({super.key, required this.item});

  @override
  State<SearchTourScreen> createState() => _SearchTourScreenState();
}

class _SearchTourScreenState extends State<SearchTourScreen> {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Consumer<ITourViewModel>(
        builder: (context, vm, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, top: 45.h, right: 25.w),
              child: Column(
                children: [
                  searchBar(),
                  vm.tourDetail.isNotEmpty
                      ? Column(
                          children: [
                            ...vm.tourDetail.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  Get.toNamed(MyRouter.detail, arguments: e);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, bottom: 20.h),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            child: Image.memory(
                                              base64Decode(e.tourId.image!),
                                              fit: BoxFit.cover,
                                              width: 324.w,
                                              height: 170.h,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 12.w,
                                              right: 12.w,
                                              top: 20.h,
                                              bottom: 15.h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 72.w,
                                                      height: 39.h,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: kPrimaryColor
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                                klPrimaryColor,
                                                          ),
                                                          Text(
                                                            e.tourId.rate
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  klPrimaryColor,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 90.w,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 60.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: textColor,
                                                      size: 25.sp,
                                                    ),
                                                    Text(
                                                      e.tourId.regionId
                                                          .nameArea,
                                                      style: TextStyle(
                                                        color: textColor,
                                                        fontFamily: fontPoppins,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, bottom: 10.h),
                                        child: Text(
                                          e.tourId.name!,
                                          style: TextStyle(
                                            color: textColor,
                                            fontFamily: fontPoppins,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.sp,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: kPrimaryColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              e.price.toString(),
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 12.sp,
                                                fontFamily: fontPoppins,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          // Container(
                                          //   child: Text(
                                          //     e.price.toString(),
                                          //     style: TextStyle(
                                          //       color: kPrimaryColor,
                                          //       fontSize: 12.sp,
                                          //       fontFamily: fontPoppins,
                                          //       fontWeight: FontWeight.w600,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 200.h),
                          child: Text(
                            "There are currently no suitable tours available!",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontFamily: fontPoppins,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(value: NavigationBars.searchs),
    );
  }
}
