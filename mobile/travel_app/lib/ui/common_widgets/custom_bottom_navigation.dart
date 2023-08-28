import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/ui/common_widgets/ripple_click_effect.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final NavigationBars value;
  const CustomBottomNavigationBar({Key? key, required this.value})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: 52.5.h,
      padding: EdgeInsets.only(
        bottom: 14.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.home);
              },
              icon: Icons.home,
              isSelected: widget.value == NavigationBars.home,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.searchs);
              },
              icon: Icons.search,
              isSelected: widget.value == NavigationBars.searchs,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.post);
              },
              icon: Icons.create_sharp,
              isSelected: widget.value == NavigationBars.voucher,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.order);
              },
              icon: Icons.density_small,
              isSelected: widget.value == NavigationBars.order,
            ),
          ),
          Expanded(
            child: BottomBarItem(
              onTap: () {
                Get.offNamed(MyRouter.account);
              },
              icon: Icons.account_circle,
              isSelected: widget.value == NavigationBars.account,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isSelected;
  const BottomBarItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RippleClickEffect(
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
              child: Icon(
                icon,
                color: isSelected ? kPrimaryColor : Colors.white,
                size: 20.sp,
              )
              //  SvgPicture.asset(
              //   image,
              //   fit: BoxFit.cover,
              //   color: isSelected
              //       ? ColorUtils.primaryRedColor
              //       : const Color(0xFF979797),
              // ),
              ),
        ],
      ),
    );
  }
}

enum NavigationBars {
  @JsonValue(0)
  home,
  @JsonValue(1)
  searchs,
  @JsonValue(2)
  voucher,
  @JsonValue(3)
  account,
  @JsonValue(3)
  order,
}
