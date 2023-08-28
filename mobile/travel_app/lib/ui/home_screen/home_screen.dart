import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/location_model_UI.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/model_ui/tour_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/iregion_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';
import 'package:travel_app/ui/common_widgets/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<LocationModelUI> locations = LocationModelUI.locations;
  late TabController tabController;
  late ITourViewModel _iTourViewModel;
  @override
  void initState() {
    _iTourViewModel = context.read<ITourViewModel>();
    _iTourViewModel.init();
    tabController = TabController(length: 4, vsync: this);
    _iRegionViewModel = context.read<IRegionViewModel>();
    _iTourViewModel = context.read<ITourViewModel>();
    _iRegionViewModel.init();
    super.initState();
  }

  late IRegionViewModel _iRegionViewModel;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 25.w, top: 45.h, right: 25.w, bottom: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tour Viet",
                style: TextStyle(
                  fontFamily: fontAbriFatface,
                  fontSize: 20.sp,
                  letterSpacing: 8.sp,
                  color: kPrimaryColor,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    "Search your dream destination",
                    style: TextStyle(
                      color: tHintColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                      size: 30.sp,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tHintColor,
                      width: 2.sp,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tHintColor,
                      width: 2.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 15.w),
                width: double.maxFinite,
                height: 465.h,
                child: Consumer<IRegionViewModel>(
                  builder: (context, vm, child) {
                    return FutureBuilder<List<RegionModelUI>>(
                      future: vm.getReigon(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            return snapshot.data!.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            right: 25.w, top: 20.h),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(30)),
                                              child: Image.memory(
                                                base64Decode(
                                                    vm.regions[index].image!),
                                                width: 233.w,
                                                height: 465.h,
                                                fit: BoxFit.cover,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                colorBlendMode:
                                                    BlendMode.modulate,
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 72.w,
                                                        height: 39.h,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kPrimaryColor
                                                              .withOpacity(0.4),
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
                                                              '5',
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
                                                    height: 202.h,
                                                  ),
                                                  Text(
                                                    "Recommended",
                                                    style: TextStyle(
                                                      color: textColor,
                                                      fontSize: 12.sp,
                                                      fontFamily: fontPoppins,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 50.h,
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
                                                        vm.regions[index]
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
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 138.w, top: 20.h),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _iTourViewModel
                                                            .getTourDetail(vm
                                                                .regions[index]
                                                                .id);
                                                        Get.toNamed(
                                                          MyRouter.search,
                                                          arguments: vm
                                                              .regions[index]
                                                              .id,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 72.w,
                                                        height: 39.h,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: kPrimaryColor
                                                              .withOpacity(0.4),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_rounded,
                                                              color:
                                                                  klPrimaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
              ),
              // Row(
              //   children: [
              //     RotatedBox(
              //       quarterTurns: 3,
              //       child: Align(
              //         child: TabBar(
              //           indicatorSize: TabBarIndicatorSize.label,
              //           indicatorColor: kPrimaryColor,
              //           labelColor: kPrimaryColor,
              //           unselectedLabelColor: Colors.white,
              //           controller: tabController,
              //           isScrollable: true,
              //           labelPadding: EdgeInsets.only(
              //               left: 20.w, right: 20.w, bottom: 5.h),
              //           tabs: const [
              //             Text("Da Lat"),
              //             Text("Da Lat"),
              //             Text("Da Lat"),
              //             Text("Da Lat"),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Flexible(
              //       child: Container(
              //         padding: EdgeInsets.only(left: 15.w),
              //         width: double.maxFinite,
              //         height: 465.h,
              //         child: TabBarView(
              //           controller: tabController,
              //           children: [
              //             ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               itemCount: locations.length,
              //               itemBuilder: (_, index) {
              //                 return Container(
              //                   margin: EdgeInsets.only(right: 25.w, top: 20.h),
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(30)),
              //                   ),
              //                   child: Stack(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: const BorderRadius.all(
              //                             Radius.circular(30)),
              //                         child: Image.asset(
              //                           color: Colors.white.withOpacity(0.7),
              //                           colorBlendMode: BlendMode.modulate,
              //                           locations[index].image,
              //                           fit: BoxFit.cover,
              //                           width: 233.w,
              //                           height: 465.h,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                           left: 12.w,
              //                           right: 12.w,
              //                           top: 20.h,
              //                           bottom: 15.h,
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               children: [
              //                                 Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       const Icon(
              //                                         Icons.star,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                       Text(
              //                                         locations[index]
              //                                             .rate
              //                                             .toString(),
              //                                         style: TextStyle(
              //                                           color: klPrimaryColor,
              //                                           fontSize: 13.sp,
              //                                           fontWeight:
              //                                               FontWeight.bold,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 90.w,
              //                                 ),
              //                                 IconButton(
              //                                   onPressed: () {
              //                                     setState(() {
              //                                       locations[index].favorite
              //                                           ? locations[index]
              //                                               .favorite = false
              //                                           : locations[index]
              //                                               .favorite = true;
              //                                     });
              //                                   },
              //                                   icon: Image.asset(
              //                                     locations[index].favorite
              //                                         ? "assets/images/favorite-full.png"
              //                                         : "assets/images/favorite.png",
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 202.h,
              //                             ),
              //                             Text(
              //                               "Recommended",
              //                               style: TextStyle(
              //                                 color: textColor,
              //                                 fontSize: 12.sp,
              //                                 fontFamily: fontPoppins,
              //                                 fontWeight: FontWeight.w600,
              //                                 letterSpacing: 1.sp,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   top: 10.h, bottom: 10.h),
              //                               child: Text(
              //                                 locations[index].name,
              //                                 style: TextStyle(
              //                                   color: textColor,
              //                                   fontFamily: fontAbriFatface,
              //                                   fontSize: 24.sp,
              //                                   fontWeight: FontWeight.w400,
              //                                   letterSpacing: 1.sp,
              //                                 ),
              //                               ),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.location_on_outlined,
              //                                   color: textColor,
              //                                   size: 25.sp,
              //                                 ),
              //                                 Text(
              //                                   locations[index].area,
              //                                   style: TextStyle(
              //                                     color: textColor,
              //                                     fontFamily: fontPoppins,
              //                                     fontSize: 12.sp,
              //                                     fontWeight: FontWeight.w600,
              //                                     letterSpacing: 1.sp,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   left: 138.w, top: 20.h),
              //                               child: InkWell(
              //                                 onTap: () {},
              //                                 child: Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: const Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Icon(
              //                                         Icons
              //                                             .arrow_forward_rounded,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             ),
              //             ListView.builder(
              //               itemCount: locations.length,
              //               itemBuilder: (_, index) {
              //                 return Container(
              //                   margin: EdgeInsets.only(right: 25.w, top: 20.h),
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(30)),
              //                   ),
              //                   child: Stack(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: const BorderRadius.all(
              //                             Radius.circular(30)),
              //                         child: Image.asset(
              //                           color: Colors.white.withOpacity(0.7),
              //                           colorBlendMode: BlendMode.modulate,
              //                           locations[index].image,
              //                           fit: BoxFit.cover,
              //                           width: 233.w,
              //                           height: 465.h,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                           left: 12.w,
              //                           right: 12.w,
              //                           top: 20.h,
              //                           bottom: 15.h,
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               children: [
              //                                 Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       const Icon(
              //                                         Icons.star,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                       Text(
              //                                         locations[index]
              //                                             .rate
              //                                             .toString(),
              //                                         style: TextStyle(
              //                                           color: klPrimaryColor,
              //                                           fontSize: 13.sp,
              //                                           fontWeight:
              //                                               FontWeight.bold,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 90.w,
              //                                 ),
              //                                 IconButton(
              //                                   onPressed: () {
              //                                     setState(() {
              //                                       locations[index].favorite
              //                                           ? locations[index]
              //                                               .favorite = false
              //                                           : locations[index]
              //                                               .favorite = true;
              //                                     });
              //                                   },
              //                                   icon: Image.asset(
              //                                     locations[index].favorite
              //                                         ? "assets/images/favorite-full.png"
              //                                         : "assets/images/favorite.png",
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 202.h,
              //                             ),
              //                             Text(
              //                               "Recommended",
              //                               style: TextStyle(
              //                                 color: textColor,
              //                                 fontSize: 12.sp,
              //                                 fontFamily: fontPoppins,
              //                                 fontWeight: FontWeight.w600,
              //                                 letterSpacing: 1.sp,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   top: 10.h, bottom: 10.h),
              //                               child: Text(
              //                                 locations[index].name,
              //                                 style: TextStyle(
              //                                   color: textColor,
              //                                   fontFamily: fontAbriFatface,
              //                                   fontSize: 24.sp,
              //                                   fontWeight: FontWeight.w400,
              //                                   letterSpacing: 1.sp,
              //                                 ),
              //                               ),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.location_on_outlined,
              //                                   color: textColor,
              //                                   size: 25.sp,
              //                                 ),
              //                                 Text(
              //                                   locations[index].area,
              //                                   style: TextStyle(
              //                                     color: textColor,
              //                                     fontFamily: fontPoppins,
              //                                     fontSize: 12.sp,
              //                                     fontWeight: FontWeight.w600,
              //                                     letterSpacing: 1.sp,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   left: 138.w, top: 20.h),
              //                               child: InkWell(
              //                                 onTap: () {},
              //                                 child: Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: const Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Icon(
              //                                         Icons
              //                                             .arrow_forward_rounded,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             ),
              //             ListView.builder(
              //               itemCount: locations.length,
              //               itemBuilder: (_, index) {
              //                 return Container(
              //                   margin: EdgeInsets.only(right: 25.w, top: 20.h),
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(30)),
              //                   ),
              //                   child: Stack(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: const BorderRadius.all(
              //                             Radius.circular(30)),
              //                         child: Image.asset(
              //                           color: Colors.white.withOpacity(0.7),
              //                           colorBlendMode: BlendMode.modulate,
              //                           locations[index].image,
              //                           fit: BoxFit.cover,
              //                           width: 233.w,
              //                           height: 465.h,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                           left: 12.w,
              //                           right: 12.w,
              //                           top: 20.h,
              //                           bottom: 15.h,
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               children: [
              //                                 Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       const Icon(
              //                                         Icons.star,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                       Text(
              //                                         locations[index]
              //                                             .rate
              //                                             .toString(),
              //                                         style: TextStyle(
              //                                           color: klPrimaryColor,
              //                                           fontSize: 13.sp,
              //                                           fontWeight:
              //                                               FontWeight.bold,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 90.w,
              //                                 ),
              //                                 IconButton(
              //                                   onPressed: () {
              //                                     setState(() {
              //                                       locations[index].favorite
              //                                           ? locations[index]
              //                                               .favorite = false
              //                                           : locations[index]
              //                                               .favorite = true;
              //                                     });
              //                                   },
              //                                   icon: Image.asset(
              //                                     locations[index].favorite
              //                                         ? "assets/images/favorite-full.png"
              //                                         : "assets/images/favorite.png",
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 202.h,
              //                             ),
              //                             Text(
              //                               "Recommended",
              //                               style: TextStyle(
              //                                 color: textColor,
              //                                 fontSize: 12.sp,
              //                                 fontFamily: fontPoppins,
              //                                 fontWeight: FontWeight.w600,
              //                                 letterSpacing: 1.sp,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   top: 10.h, bottom: 10.h),
              //                               child: Text(
              //                                 locations[index].name,
              //                                 style: TextStyle(
              //                                   color: textColor,
              //                                   fontFamily: fontAbriFatface,
              //                                   fontSize: 24.sp,
              //                                   fontWeight: FontWeight.w400,
              //                                   letterSpacing: 1.sp,
              //                                 ),
              //                               ),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.location_on_outlined,
              //                                   color: textColor,
              //                                   size: 25.sp,
              //                                 ),
              //                                 Text(
              //                                   locations[index].area,
              //                                   style: TextStyle(
              //                                     color: textColor,
              //                                     fontFamily: fontPoppins,
              //                                     fontSize: 12.sp,
              //                                     fontWeight: FontWeight.w600,
              //                                     letterSpacing: 1.sp,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   left: 138.w, top: 20.h),
              //                               child: InkWell(
              //                                 onTap: () {},
              //                                 child: Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: const Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Icon(
              //                                         Icons
              //                                             .arrow_forward_rounded,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             ),
              //             ListView.builder(
              //               itemCount: locations.length,
              //               itemBuilder: (_, index) {
              //                 return Container(
              //                   margin: EdgeInsets.only(right: 25.w, top: 20.h),
              //                   decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(30)),
              //                   ),
              //                   child: Stack(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: const BorderRadius.all(
              //                             Radius.circular(30)),
              //                         child: Image.asset(
              //                           color: Colors.white.withOpacity(0.7),
              //                           colorBlendMode: BlendMode.modulate,
              //                           locations[index].image,
              //                           fit: BoxFit.cover,
              //                           width: 233.w,
              //                           height: 465.h,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                           left: 12.w,
              //                           right: 12.w,
              //                           top: 20.h,
              //                           bottom: 15.h,
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.end,
              //                               children: [
              //                                 Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       const Icon(
              //                                         Icons.star,
              //                                         color: klPrimaryColor,
              //                                       ),
              //                                       Text(
              //                                         locations[index]
              //                                             .rate
              //                                             .toString(),
              //                                         style: TextStyle(
              //                                           color: klPrimaryColor,
              //                                           fontSize: 13.sp,
              //                                           fontWeight:
              //                                               FontWeight.bold,
              //                                         ),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 90.w,
              //                                 ),
              //                                 IconButton(
              //                                   onPressed: () {
              //                                     setState(() {
              //                                       locations[index].favorite
              //                                           ? locations[index]
              //                                               .favorite = false
              //                                           : locations[index]
              //                                               .favorite = true;
              //                                     });
              //                                   },
              //                                   icon: Image.asset(
              //                                     locations[index].favorite
              //                                         ? "assets/images/favorite-full.png"
              //                                         : "assets/images/favorite.png",
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 202.h,
              //                             ),
              //                             Text(
              //                               "Recommended",
              //                               style: TextStyle(
              //                                 color: textColor,
              //                                 fontSize: 12.sp,
              //                                 fontFamily: fontPoppins,
              //                                 fontWeight: FontWeight.w600,
              //                                 letterSpacing: 1.sp,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   top: 10.h, bottom: 10.h),
              //                               child: Text(
              //                                 locations[index].name,
              //                                 style: TextStyle(
              //                                   color: textColor,
              //                                   fontFamily: fontAbriFatface,
              //                                   fontSize: 24.sp,
              //                                   fontWeight: FontWeight.w400,
              //                                   letterSpacing: 1.sp,
              //                                 ),
              //                               ),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.location_on_outlined,
              //                                   color: textColor,
              //                                   size: 25.sp,
              //                                 ),
              //                                 Text(
              //                                   locations[index].area,
              //                                   style: TextStyle(
              //                                     color: textColor,
              //                                     fontFamily: fontPoppins,
              //                                     fontSize: 12.sp,
              //                                     fontWeight: FontWeight.w600,
              //                                     letterSpacing: 1.sp,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                   left: 138.w, top: 20.h),
              //                               child: InkWell(
              //                                 onTap: () {},
              //                                 child: Container(
              //                                   width: 72.w,
              //                                   height: 39.h,
              //                                   alignment: Alignment.center,
              //                                   decoration: BoxDecoration(
              //                                     color: kPrimaryColor
              //                                         .withOpacity(0.4),
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             20.r),
              //                                   ),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       IconButton(
              //                                         icon: const Icon(
              //                                           Icons
              //                                               .arrow_forward_rounded,
              //                                           color: klPrimaryColor,
              //                                         ),
              //                                         onPressed: () {
              //                                           // Get.toNamed();
              //                                         },
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              Padding(
                padding: EdgeInsets.only(top: 22.h, bottom: 15.h),
                child: Text(
                  "Top 4 most prominent tourist areas",
                  style: TextStyle(
                    fontFamily: fontPoppins,
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.w),
                width: double.maxFinite,
                height: 140.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: locations.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 25.w, top: 20.h),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Image.asset(
                              color: Colors.white.withOpacity(0.7),
                              colorBlendMode: BlendMode.modulate,
                              locations[index].image,
                              fit: BoxFit.cover,
                              width: 250.w,
                              height: 140.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              top: 10.h,
                              bottom: 15.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 72.w,
                                      height: 39.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: klPrimaryColor,
                                          ),
                                          Text(
                                            locations[index].rate.toString(),
                                            style: TextStyle(
                                              color: klPrimaryColor,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90.w,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          locations[index].favorite
                                              ? locations[index].favorite =
                                                  false
                                              : locations[index].favorite =
                                                  true;
                                        });
                                      },
                                      icon: Image.asset(
                                        locations[index].favorite
                                            ? "assets/images/favorite-full.png"
                                            : "assets/images/favorite.png",
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  locations[index].name,
                                  style: TextStyle(
                                    color: textColor,
                                    fontFamily: fontAbriFatface,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: textColor,
                                      size: 10.sp,
                                    ),
                                    Text(
                                      locations[index].area,
                                      style: TextStyle(
                                        color: textColor,
                                        fontFamily: fontPoppins,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(value: NavigationBars.home),
    );
  }
}
