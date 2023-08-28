import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/address_model_UI.dart';
import 'package:travel_app/core/model_ui/region_model_UI.dart';
import 'package:travel_app/core/view_model/interfaces/iaddress_view_model.dart';
import 'package:travel_app/ui/create_tour_screen/widget/create_text_field.dart';
import '../../core/dto/tour_dto.dart';
import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../../core/view_model/interfaces/iregion_view_model.dart';

class CreateTourScreen extends StatefulWidget {
  const CreateTourScreen({super.key});

  @override
  State<CreateTourScreen> createState() => _CreateTourScreenState();
}

class _CreateTourScreenState extends State<CreateTourScreen> {
  late IRegionViewModel _iRegionViewModel;
  late IAddressViewModel _iAddressViewModel;

  List<AddressModelUI> listAddress = [];

  List<String> description = [];

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController noteController;

  bool validName = false;
  bool validEmail = false;
  bool validPhone = false;
  bool validAddress = false;

  bool tourguide = false;
  int adultAmount = 1;
  int childrenAmount = 0;
  int babyAmount = 0;
  int numberOfDay = 0;

  String destination = '';
  String accommodation = 'Hotel';
  String transport = 'Bus';
  String type = 'Economy';

  String textError = '';

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // doDate();
      });
    }
  }

  DateTime selectedDate2 = DateTime.now();
  Future<void> _selectDate2(BuildContext context, DateTime d) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: d,
        firstDate: d,
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
        doDate();
      });
    }
  }

  doDate() {
    numberOfDay = (selectedDate2.difference(selectedDate).inDays) + 1;
  }

  doUp(String which) {
    switch (which) {
      case 'adult':
        setState(() {
          adultAmount++;
        });
        break;
      case 'children':
        setState(() {
          childrenAmount++;
        });
        break;
      case 'baby':
        setState(() {
          babyAmount++;
        });
        break;
    }
  }

  doDown(String which) {
    switch (which) {
      case 'adult':
        setState(() {
          if (adultAmount > 1) {
            adultAmount--;
          }
        });
        break;
      case 'children':
        setState(() {
          if (childrenAmount > 0) {
            childrenAmount--;
          }
        });
        break;
      case 'baby':
        setState(() {
          if (babyAmount > 0) {
            babyAmount--;
          }
        });
        break;
    }
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    noteController = TextEditingController();

    // nameController.text = '${locator<GlobalData>().currentUser!.firstName} ${locator<GlobalData>().currentUser!.lastName}';
    // emailController.text = locator<GlobalData>().currentUser!.email;
    // phoneController.text = locator<GlobalData>().currentUser!.phone!;
    // addressController.text = locator<GlobalData>().currentUser!.address!;

    _iRegionViewModel = context.read<IRegionViewModel>();
    _iRegionViewModel.init();
    _iAddressViewModel = context.read<IAddressViewModel>();
    _iAddressViewModel.init();
    super.initState();
  }

  void findAddress(int id) {
    setState(() {
      listAddress = _iAddressViewModel.getAddressById(id);
    });
  }

  doDescription() {
    String result = '';
    for (var i in description) {
      result += '${i.toString()}, ';
    }
    return result;
  }

  doCreate() async {
    CreateTourDto tour = CreateTourDto(
      region: destination,
      accommodation: accommodation,
      transport: transport,
      description: doDescription(),
      adult: adultAmount,
      children: childrenAmount,
      baby: babyAmount,
      startdate: selectedDate,
      enddate: selectedDate2,
      fullname: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      userId: 5,
      // locator<GlobalData>().currentUser!.id
      tourguide: tourguide,
      note: noteController.text,
      type: type,
    );

    try {
      await getRestClient().createTour(tour);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Create Tour',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.sp,
            fontFamily: fontPoppins,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, top: 15.h, right: 20.w, bottom: 30.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Accommodation',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                  // disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: const [
                  "Hotel",
                  "Resort",
                  "Homstay",
                  "Villas and apartments for rent"
                ],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: TextStyle(
                      color: textColor, fontSize: 18.sp, letterSpacing: .5.sp),
                  dropdownSearchDecoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xff385756),
                  ),
                ),
                onChanged: (String? value) {
                  accommodation = value!;
                },
                selectedItem: accommodation,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Transport',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                  // disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: const ["Bus", "Self-sufficient travel"],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: TextStyle(
                      color: textColor, fontSize: 18.sp, letterSpacing: .5.sp),
                  dropdownSearchDecoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xff385756),
                  ),
                ),
                onChanged: (String? value) {
                  transport = value!;
                },
                selectedItem: transport,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Tour type',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                  // disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: const ["Economy", "Standards", "Premium"],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: TextStyle(
                      color: textColor, fontSize: 18.sp, letterSpacing: .5.sp),
                  dropdownSearchDecoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xff385756),
                  ),
                ),
                onChanged: (String? value) {
                  type = value!;
                },
                selectedItem: type,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tour guide',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Radio(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => textColor),
                    value: true,
                    groupValue: tourguide,
                    toggleable: true,
                    onChanged: (value) {
                      setState(() {
                        tourguide = !tourguide;
                        print(tourguide);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    'Number of passengers',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
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
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            'Aged 12 years and older',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15.sp,
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
                                doDown('adult');
                              },
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 25.w,
                                height: 25.h,
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
                                doUp('adult');
                              },
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 25.w,
                                height: 25.h,
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
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            'From 3 to 11 years old',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15.sp,
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
                              onTap: () => {doDown('children')},
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 25.w,
                                height: 25.h,
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
                              onTap: () => {doUp('children')},
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 25.w,
                                height: 25.h,
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
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            'Under 2 years old',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15.sp,
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
                              onTap: () => {doDown('baby')},
                              child: Image.asset(
                                "assets/images/icon_minus.png",
                                width: 25.w,
                                height: 25.h,
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
                              onTap: () => {doUp('baby')},
                              child: Image.asset(
                                "assets/images/icon_plus.png",
                                width: 25.w,
                                height: 25.h,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () => _selectDate(context),
                    child: const Text(
                      'Start Date',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(selectedDate.toLocal()),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () => _selectDate2(context, selectedDate),
                    child: Container(
                      width: 60.w,
                      alignment: Alignment.center,
                      child: const Text(
                        'End Date',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(selectedDate2.toLocal()),
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Destination',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Consumer<IRegionViewModel>(
                builder: (context, vm, child) {
                  return FutureBuilder<List<RegionModelUI>>(
                    future: vm.getReigon(),
                    builder: (context, snapshot) {
                      return DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                          fit: FlexFit.loose,
                          // disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: vm.regions.map((e) {
                          return e.nameArea;
                        }).toList(),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          baseStyle: TextStyle(
                              color: textColor,
                              fontSize: 18.sp,
                              letterSpacing: .5.sp),
                          dropdownSearchDecoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xff385756),
                          ),
                        ),
                        onChanged: (String? value) {
                          destination = value!;
                          findAddress(_iRegionViewModel.findId(value));
                        },
                        selectedItem: 'Select destination',
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: numberOfDay * 70.h,
                width: 320.w,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: numberOfDay,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Day ${index + 1}',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 250.w,
                          child: DropdownSearch<String>(
                            popupProps: const PopupProps.menu(
                              showSelectedItems: true,
                              fit: FlexFit.loose,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: listAddress.map((e) {
                              return e.name;
                            }).toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              baseStyle: TextStyle(
                                  color: textColor,
                                  fontSize: 18.sp,
                                  letterSpacing: .5.sp),
                              dropdownSearchDecoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xff385756),
                              ),
                            ),
                            onChanged: (String? value) {
                              try {
                                description[index] = 'Day ${index + 1}: $value';
                              } catch (e) {
                                description.add('Day ${index + 1}: $value');
                              }
                            },
                            selectedItem: 'Select Address',
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              Center(
                child: Text(
                  textError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.sp,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 0.w,
                  right: 0.w,
                  top: 10.h,
                ),
                child: Divider(
                  color: hBackgroundColor,
                  height: 5.h,
                  thickness: 5.w,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CreateTourTextField(
                controller: nameController,
                label: 'Name',
                valid: validName,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CreateTourTextField(
                controller: emailController,
                label: 'Email',
                valid: validEmail,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CreateTourTextField(
                controller: phoneController,
                label: 'Phone',
                valid: validPhone,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CreateTourTextField(
                controller: addressController,
                label: 'Address',
                valid: validAddress,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    'Note',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFormField(
                controller: noteController,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: textColor,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff385756),
                ),
                minLines: 4,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    validName =
                        !RegExp(r"^[a-zA-Z\s]+$").hasMatch(nameController.text);
                    validEmail = !RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text);
                    validPhone = !RegExp(r"^[0-9]{6,11}$")
                        .hasMatch(phoneController.text);
                    validAddress = !RegExp(r"^[A-Za-z0-9'\.\-\s\,]+$")
                        .hasMatch(addressController.text);
                  });
                  if (!validName &&
                      !validAddress &&
                      !validEmail &&
                      !validPhone &&
                      destination != '' &&
                      description.isNotEmpty) {
                    doCreate().then((value) {
                      if (value) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                      color: const Color(0XFF344A43),
                                      width: 5.sp)),
                              child: SizedBox(
                                height: 350.h,
                                width: 400.w,
                                child: Column(children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.w, top: 20.h),
                                    child: Image.asset(
                                      'assets/images/icon_update.png',
                                      width: 180.w,
                                      height: 180.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.w, top: 20.h),
                                    child: Text(
                                      "Create Success",
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
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal:
                                                30.0), // Điều chỉnh padding ngang để làm cho button dài hơn
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                      }
                    });
                  } else {
                    setState(() {
                      textError = 'Destination and Address must be field';
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(7),
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Create',
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
