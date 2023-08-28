import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/iregion_view_model.dart';
import 'package:travel_app/core/view_model/interfaces/itour_view_model.dart';
import 'package:travel_app/ui/common_widgets/custom_bottom_navigation.dart';
import 'package:travel_app/ui/search_screen/widget/search_bar.dart';
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late IRegionViewModel _iRegionViewModel;
  late ITourViewModel _iTourViewModel;
  late TabController tabController;
  @override
  void initState() {
    _iRegionViewModel = context.read<IRegionViewModel>();
    _iTourViewModel = context.read<ITourViewModel>();
    _iRegionViewModel.init();
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
      body: Consumer<IRegionViewModel>(
        builder: (context, vm, child) {
          return FutureBuilder<List<RegionModelUI>>(
            future: vm.getReigon(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return snapshot.data!.isNotEmpty
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.w,
                                top: 45.h,
                                right: 25.w,
                                bottom: 40.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                searchBar(),
                                SizedBox(
                                  height: 800.h,
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    children: [
                                      ...vm.regions
                                          .map((item) =>
                                              buildImage(item, _iTourViewModel))
                                          .toList(),
                                    ],
                                  ),
                                ),
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
          const CustomBottomNavigationBar(value: NavigationBars.searchs),
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
