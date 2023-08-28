import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';

class DetailOrderScreen extends StatefulWidget {
  final BookingTourDto item;
  const DetailOrderScreen({super.key, required this.item});

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<ScheduleModelUI> scheduleList = [];
  late ITourViewModel _iTourViewModel;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _iTourViewModel = context.read<ITourViewModel>();
    scheduleList = _iTourViewModel.tourDetail;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(
                      base64Decode(widget.item.scheduleId.tourId.image)),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 25.h, right: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.scheduleId.tourId.name!,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: fontAbriFatface,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "\$${widget.item.scheduleId.price}",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12.sp,
                            fontFamily: fontPoppins,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                        child: Container(
                          width: 190.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF55776C),
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                            color: const Color(0xFF55776C),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Hotline: 1900 6568",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: fontPoppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: const Color(0xccCBD5E1),
                    height: 40.h,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Text(
                    widget.item.scheduleId.tourId.description!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: fontPoppins,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),

                  // Container(
                  //   constraints: BoxConstraints(
                  //     minHeight: 0,
                  //     maxHeight: double.infinity,
                  //   ),
                  //   child: TabBarView(
                  //     controller: tabController,
                  //     children: [
                  //       Text("data"),
                  //       Text("data"),
                  //       Text("data"),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "(*) Children from 1m - 1m3 charge child ticket",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontPoppins,
                          ),
                        ),
                        Text(
                          "(*) Over 1m3 is charged as an adult",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontPoppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Profile Detail",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: fontAbriFatface,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                  Divider(
                    color: const Color(0xccCBD5E1),
                    height: 40.h,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Adult: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                      Text(
                        "${widget.item.adult}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Children: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                      Text(
                        "${widget.item.children}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Baby: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                      Text(
                        "${widget.item.baby}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontPoppins,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Flexible(
            //   child: Container(
            //     padding: EdgeInsets.only(left: 15.w),
            //     width: double.maxFinite,
            //     height: 465.h,
            //     child: TabBarView(controller: tabController, children: [
            //       Text("data"),
            //       Text("data"),
            //       Text("data"),
            //     ]),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
