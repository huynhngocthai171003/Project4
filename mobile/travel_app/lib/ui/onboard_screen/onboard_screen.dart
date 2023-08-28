import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/onboard_model_UI.dart';
import 'package:travel_app/ui/login_screen/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  final List<OnboardModelUI> items = OnboardModelUI.items;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: items.map((e) => OnBoardingItem(item: e)).toList(),
              onPageChanged: (value) {
                setState(() {
                  a = value;
                });
              },
            ),
            Container(
              alignment: Alignment(0.sp, 0.5.sp),
              child: Padding(
                padding: EdgeInsets.only(left: 29.w, right: 29.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 665.h,
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: items.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Color(0xffffffff),
                        dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor: kPrimaryColor,
                        spacing: 16,
                      ),
                    ),
                    SizedBox(
                      height: 51.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        a > 0
                            ? GestureDetector(
                                onTap: () {
                                  _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                  setState(
                                    () {
                                      a--;
                                    },
                                  );
                                },
                                child: Image.asset('assets/images/btnBack.png'),
                              )
                            : GestureDetector(
                                onTap: () {},
                                child: const SizedBox(
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                        a != items.length - 1
                            ? GestureDetector(
                                onTap: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                  setState(
                                    () {
                                      if (a > items.length) {
                                        a = items.length;
                                      } else {
                                        a++;
                                      }
                                    },
                                  );
                                },
                                child: Image.asset('assets/images/btnNext.png'),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset('assets/images/btnSign.png'),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  final OnboardModelUI item;
  const OnBoardingItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 29.w, right: 29.w, top: 510.h),
          child: Text(
            item.text,
            style: TextStyle(
              color: textColor,
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              fontFamily: fontPoppins,
              wordSpacing: 3.sp,
              letterSpacing: 3.sp,
            ),
          ),
        ),
      ],
    );
  }
}
