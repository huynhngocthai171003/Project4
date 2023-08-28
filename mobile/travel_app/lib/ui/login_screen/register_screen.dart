import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/ui/login_screen/witget/text_field_register.dart';
import '../../core/dto/auth/register_dto.dart';
import '../../core/global/locator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool validFirstName = false;
  bool validLastName = false;
  bool validEmail = false;
  bool validPassword = false;

  String instructionEmail = "Invalid email";

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
  }

  void doRegister() async {
    setState(() {
      validFirstName =
          !RegExp(r"^[a-zA-Z\s]+$").hasMatch(firstNameController.text);
      validLastName = !RegExp(r"^[a-zA-Z\s]+$").hasMatch(lastNameController.text);
      validEmail = !RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text);
      validPassword = !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
          .hasMatch(passwordController.text);
    });

    if (!validFirstName && !validLastName && !validEmail && !validPassword) {
      RegisterDto user = RegisterDto(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          roleId: 5,
          status: 1);

      try {
        await getRestClient().register(user);
        Get.toNamed(MyRouter.login);
      } catch (e) {
        setState(() {
          validEmail = true;
          instructionEmail = "Email is already in use";
        });
        print(e);
      }
    }
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
                image: AssetImage('assets/images/register.png'),
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
                        height: 100.h,
                      ),
                      Text(
                        'Register',
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
                      MyTextFieldRegister(
                        controller: firstNameController,
                        label: "First Name",
                        isObscureText: false,
                        valid: validFirstName,
                        icon: Icons.abc,
                        instruction: 'Invalid first name',
                      ),
                      SizedBox(
                        height: 22.5.h,
                      ),
                      MyTextFieldRegister(
                        controller: lastNameController,
                        label: "Last Name",
                        isObscureText: false,
                        valid: validLastName,
                        icon: Icons.abc,
                        instruction: 'Invalid last name',
                      ),
                      SizedBox(
                        height: 22.5.h,
                      ),
                      MyTextFieldRegister(
                        controller: emailController,
                        label: "Email",
                        isObscureText: false,
                        valid: validEmail,
                        icon: Icons.email,
                        instruction: instructionEmail,
                      ),
                      SizedBox(
                        height: 22.5.h,
                      ),
                      MyTextFieldRegister(
                        controller: passwordController,
                        label: "Password",
                        isObscureText: true,
                        valid: validPassword,
                        icon: Icons.lock,
                        instruction:
                            'as least 6 characters(uppercase,lowercase,digit)',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36.5.h,
                ),
                InkWell(
                  onTap: () {
                    doRegister();
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
                      "Register",
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
                    "Or Register With",
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
                      onTap: () {
                        print("a");
                      },
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
                            ]),
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
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(MyRouter.login),
                        child: Text(
                          "Login here",
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

  Padding methodRegister(String lable, {bool isObscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(right: 31.5.w),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: isObscureText,
        decoration: InputDecoration(
          label: Text(
            lable,
            style: TextStyle(
              color: tHintColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          prefixIcon: Icon(
            isObscureText ? Icons.lock : Icons.account_circle_outlined,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
