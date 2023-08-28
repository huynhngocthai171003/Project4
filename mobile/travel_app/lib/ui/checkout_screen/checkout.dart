import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/dto/booking_dto.dart';
import 'package:travel_app/core/dto/payment_dto.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/global/router.dart';
import 'package:travel_app/core/model_ui/schedule_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/icart_view_model.dart';

import '../../constants.dart';

class CheckoutScreen extends StatefulWidget {
  final ScheduleModelUI item;
  const CheckoutScreen({super.key, required this.item});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool paymentMethodCash = true;

  int adultAmount = 1;
  int childrenAmount = 0;
  int babyAmount = 0;

  double totalAmount = 0;

  late ICartViewModel _cartViewModel;

  @override
  void initState() {
    _cartViewModel = context.read<ICartViewModel>();
    totalAmount = widget.item.price;

    super.initState();
  }

  Future<void> bookTour() async {
    var date = DateTime.now();
    BookingTourDto booking;
    BookingTourDto tour = BookingTourDto(
      id: null,
      scheduleId: widget.item,
      userId: locator<GlobalData>().currentUser!,
      adult: adultAmount,
      children: childrenAmount,
      baby: babyAmount,
      bookingDate: date.toIso8601String(),
      regionId: widget.item.tourId.regionId,
      senior: 0,
    );

    booking = await _cartViewModel.bookTour(tour);

    PaymentDto pay = PaymentDto(
      price: totalAmount,
      status: 0,
      description: "UNPAID",
      userId: locator<GlobalData>().currentUser!.id,
      bookingId: booking.id!,
      paymentMethod: 1,
      date: date.toIso8601String(),
    );

    await _cartViewModel.payment(pay);
  }

  void doAdd() {
    setState(() {
      totalAmount = adultAmount * widget.item.price +
          childrenAmount * widget.item.price / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Booking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.sp,
            fontFamily: fontPoppins,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, top: 5.h, right: 20.w, bottom: 20.h),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Tour Nha Trang | Hon Lao - Doc Let - I Resort - Vien Hai Duong Hoc',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  children: [],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'NUMBER OF PASSENGER',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17.sp,
                      letterSpacing: 1.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Adult',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                          Text(
                            'Aged 12 years and older',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 90.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (adultAmount > 1) {
                                  setState(() {
                                    adultAmount--;
                                    doAdd();
                                  });
                                }
                              },
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                            Text(
                              '$adultAmount',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  adultAmount++;
                                  doAdd();
                                });
                              },
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Children',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                          Text(
                            'From 3 to 11 years old',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 90.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (childrenAmount > 0) {
                                  setState(() {
                                    childrenAmount--;
                                    doAdd();
                                  });
                                }
                              },
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                            Text(
                              '$childrenAmount',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  childrenAmount++;
                                  doAdd();
                                });
                              },
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Baby',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                          Text(
                            'Under 2 years old',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 90.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (babyAmount > 0) {
                                  setState(() {
                                    babyAmount--;
                                    doAdd();
                                  });
                                }
                              },
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                            Text(
                              '$babyAmount',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  babyAmount++;
                                  doAdd();
                                });
                              },
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 23.w,
                                height: 23.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Text(
                    'PAYMENT',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17.sp,
                      letterSpacing: 1.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Color(0xff385756),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: Image(
                            image: AssetImage("assets/images/icon_cash.png")),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payment on delivery",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: fontPoppins,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "Household collection fee: 0",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: fontPoppins,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => kPrimaryColor),
                            value: true,
                            groupValue: paymentMethodCash,
                            onChanged: (value) {
                              setState(() {
                                paymentMethodCash = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA6A29E),
                    ),
                  ),
                  Text(
                    '\$$totalAmount ',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ),
                ],
              ),
              InkWell(
                onTap: () => {
                  bookTour().then((value) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: const Color(0XFF344A43), width: 5.sp)),
                          child: SizedBox(
                            height: 350.h,
                            width: 400.w,
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, top: 20.h),
                                child: Image.asset(
                                  'assets/images/icon_update.png',
                                  width: 180.w,
                                  height: 180.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.w, top: 20.h),
                                child: Text(
                                  "Booking Success",
                                  style: TextStyle(
                                    color: const Color(0XFF344A43),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.sp,
                                    fontFamily: fontPoppins,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(MyRouter.home);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            30.0), // Điều chỉnh padding ngang để làm cho button dài hơn
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Container(
                                    width:
                                        150.0, // Điều chỉnh chiều dài của button
                                    child: Center(
                                      child: Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: fontPoppins,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    );
                  }),
                },
                child: Container(
                  width: double.infinity,
                  // margin: EdgeInsets.only(right: 30.w, left: 30.w, top: 20.h),
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
