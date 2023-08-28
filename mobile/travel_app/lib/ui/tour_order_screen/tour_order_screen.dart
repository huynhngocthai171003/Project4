import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/icart_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';
import 'package:travel_app/ui/common_widgets/custom_bottom_navigation.dart';
import 'dart:convert';

class TourOrderScreen extends StatefulWidget {
  const TourOrderScreen({super.key});

  @override
  State<TourOrderScreen> createState() => _TourOrderScreenState();
}

class _TourOrderScreenState extends State<TourOrderScreen> {
  late ICartViewModel _iCartViewModel;
  late TabController tabController;
  @override
  void initState() {
    _iCartViewModel = context.read<ICartViewModel>();
    _iCartViewModel.init();
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
      body: Consumer<ICartViewModel>(
        builder: (context, vm, child) {
          return FutureBuilder<List<BookingTourDto>>(
            future: vm.tourOrder(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return snapshot.data!.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.w, top: 45.h, right: 25.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/preview.png",
                                      width: 50.w,
                                      height: 50.h,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Wellcome",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: fontPoppins,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          locator<GlobalData>()
                                              .currentUser!
                                              .firstName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontFamily: fontPoppins,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.h, bottom: 15.h),
                                  child: Text(
                                    "Your History Order",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ...vm.tourOrders.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      Get.toNamed(MyRouter.detailOrder,
                                          arguments: e);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.h, bottom: 20.h),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30)),
                                                child: Image.memory(
                                                  base64Decode(e
                                                      .scheduleId.tourId.image),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: kPrimaryColor
                                                                .withOpacity(
                                                                    0.4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r),
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
                                                                e.scheduleId
                                                                    .tourId.rate
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      klPrimaryColor,
                                                                  fontSize:
                                                                      13.sp,
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
                                                          e
                                                              .scheduleId
                                                              .tourId
                                                              .regionId
                                                              .nameArea,
                                                          style: TextStyle(
                                                            color: textColor,
                                                            fontFamily:
                                                                fontPoppins,
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
                                              e.scheduleId.tourId.name!,
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
                                                      BorderRadius.circular(
                                                          20.r),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '\$${e.scheduleId.price * e.adult + e.scheduleId.price * e.children}',
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
                                )
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            "Không có sản phẩm nào!",
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
      bottomNavigationBar:
          const CustomBottomNavigationBar(value: NavigationBars.order),
    );
  }
}

Widget buildImage(RegionModelUI item, ITourViewModel vm) {
  return InkWell(
    onTap: () {
      vm.getTourDetail(item.id);
      Get.toNamed(
        MyRouter.search,
        arguments: item.id,
      );
      // vm.getTourByRegion(item.id);
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                item.nameArea,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: fontAbriFatface,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.sp,
                ),
              ),
              // Text(
              //   item.description!,
              //   style: TextStyle(
              //     fontSize: 12.sp,
              //     fontFamily: fontPoppins,
              //     fontWeight: FontWeight.w600,
              //     color: Colors.white,
              //     letterSpacing: 1.sp,
              //   ),
              // ),
            ],
          ),
        ),
        Image.memory(
          base64Decode(item.image!),
          height: 100.h,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}
