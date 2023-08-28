import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/view_model/interfaces/istart_screen_view_model.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late IStartScreenViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = context.read<IStartScreenViewModel>();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    _viewModel.goToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D3133),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 157.h,
              ),
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: EdgeInsets.only(top: 211.h, left: 77.w, right: 77.w),
                child: Column(
                  children: [
                    Text(
                      "Tour Viet",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 36.sp,
                        fontFamily: "Abril Fatface",
                        letterSpacing: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Natural Travel",
                      style: TextStyle(
                        color: const Color(0xffFFFFFF),
                        fontSize: 20.sp,
                        fontFamily: "Abyssinica SIL",
                        letterSpacing: 5.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
