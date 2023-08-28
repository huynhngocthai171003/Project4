import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/view_model/interfaces/iauth_view_model.dart';
import 'package:travel_app/ui/login_screen/witget/text_field.dart';

import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool validUsername = false;
  bool validPassword = false;
  String textValidate = '';

  final GlobalKey<FormState> _formKeyUser = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();

  late IAuthViewModel _authViewModel;

  void doLogin() async {
    try {
      await _authViewModel.login(
          usernameController.text, passwordController.text);
      if (locator<GlobalData>().currentUser == null) {
        setState(() {
          textValidate = 'Email or password is wrong';
        });
      }
    } catch (e) {
      setState(() {
        textValidate = 'Email or password is wrong';
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _authViewModel = context.read<IAuthViewModel>();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35.w, top: 58.h, right: 35.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 269.h,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontFamily: fontAbriFatface,
                          letterSpacing: 3.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Form(
                        key: _formKeyUser,
                        child: MyTextField(
                          controller: usernameController,
                          label: 'Email',
                          isObscureText: false,
                          valid: validUsername,
                        ),
                      ),
                      SizedBox(
                        height: 22.5.h,
                      ),
                      Form(
                        key: _formKeyPassword,
                        child: MyTextField(
                          controller: passwordController,
                          label: 'Password',
                          isObscureText: true,
                          valid: validPassword,
                        ),
                      ),
                      Center(
                        child: Text(
                          textValidate,
                          style: const TextStyle(
                              height: 2,
                              color: Color.fromARGB(255, 221, 65, 54),
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36.5.h,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      usernameController.text == ''
                          ? validUsername = true
                          : validUsername = false;
                      passwordController.text == ''
                          ? validPassword = true
                          : validPassword = false;
                    });

                    if (usernameController.text != '' &&
                        passwordController.text != '') {
                      doLogin();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 47.h,
                    width: 304.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 9.h),
                  child: Text(
                    "Or Login With",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 79.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: hBackgroundColor,
                          border: Border.all(
                            color: hBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset("assets/images/google_icon.png"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(MyRouter.register),
                        child: Text(
                          "Register here",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
