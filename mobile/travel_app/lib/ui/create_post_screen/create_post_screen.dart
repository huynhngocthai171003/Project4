import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:http_parser/http_parser.dart';
import 'package:travel_app/ui/post_screen/post_screen.dart';
import '../../core/global/global_data.dart';
import '../../core/global/locator.dart';
import '../../core/view_model/interfaces/ipost_view_model.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File? _selectedImage;
  late TextEditingController statusController;
  late TextEditingController hashtagController;
  late IPostViewModel _iPostViewModel;

  String textError = '';
  Dio dio = Dio();
  @override
  void initState() {
    _iPostViewModel = context.read<IPostViewModel>();
    _iPostViewModel.init();
    statusController = TextEditingController();
    hashtagController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            // locator<GlobalData>().currentUser!.firstName,
                            'chua lam',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                letterSpacing: 2.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (_selectedImage != null) {
                            doCreate().then((value) {
                              if (value) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: const Color(0XFF344A43),
                                              width: 5.sp)),
                                      child: SizedBox(
                                        height: 350.h,
                                        width: 400.w,
                                        child: Column(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.w, top: 20.h),
                                            child: Image.asset(
                                              'assets/images/icon_update.png',
                                              width: 180.w,
                                              height: 180.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.w, top: 20.h),
                                            child: Text(
                                              "Create Post Success",
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
                                                Get.to(const PostScreen());
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal:
                                                        30.0), // Điều chỉnh padding ngang để làm cho button dài hơn
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: const BorderSide(
                                                      color: Colors.black,
                                                      width: 2.0),
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                              textError = 'Please choose image';
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 37.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor,
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                          ),
                          child: Text(
                            "Post",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    controller: statusController,
                    style: const TextStyle(
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'What are you thinking?',
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        color: textColor,
                        letterSpacing: 1.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  TextField(
                    controller: hashtagController,
                    style: const TextStyle(
                      color: textColor,
                    ),
                    decoration: InputDecoration(
                      hintText: '#hashtag',
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        letterSpacing: 1.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                  SizedBox(
                    height: 10.h,
                  ),
                  _selectedImage != null
                      ? Column(
                          children: [
                            Image.file(
                              _selectedImage!,
                              width: double.infinity,
                              height: 350.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            InkWell(
                              onTap: () {
                                chooseAnother();
                              },
                              child: Container(
                                width: 200.w,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 30, 62, 61),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      color: textColor,
                                      size: 20.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Choose another',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            pickImageFromGallary();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 350.h,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 30, 62, 61),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  color: textColor,
                                  size: 35.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'Choose a photo',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  // _bytesImage != null ? Image.memory(_bytesImage!) : Text('abc'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> doCreate() async {
    var imageBytes = _selectedImage!.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    PostModelUI post = PostModelUI(
      image: base64Image,
      name: locator<GlobalData>().currentUser!.firstName!,
      status: statusController.text,
      postDate: DateTime.now(),
      hashtag: hashtagController.text,
      userId: locator<GlobalData>().currentUser!,
    );

    try {
      var result = await _iPostViewModel.createPost(post);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
    // try {
    //   final dio = Dio();

    //   dio.options.headers = {'Content-Type': 'multipart/form-data'};
    //   String filename = _selectedImage!.path.split('/').last;
    //   final file = await MultipartFile.fromFile(
    //     _selectedImage!.path,
    //     filename: filename,
    //   );

    //   final formData = FormData.fromMap({
    //     'post': jsonEncode({
    //       'image': '',
    //       'name': locator<GlobalData>().currentUser!.firstName,
    //       'status': statusController.text,
    //       'postDate': DateTime.now().toIso8601String(),
    //       'hashtag': hashtagController.text,
    //       'userId': locator<GlobalData>().currentUser!.id,
    //     }),
    //     'image': file
    //   }); // 'file' - this is an api key, can be different

    //   final response = await dio.post(
    //     // or dio.post
    //     "http://10.0.2.2:8888/api/users/posts",
    //     data: formData,
    //   );
    //   return true;
    // } catch (err) {
    //   print('uploading error: $err');
    // }
    // return false;
  }

  Future pickImageFromGallary() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future chooseAnother() async {
    setState(() {
      _selectedImage = null;
    });
    pickImageFromGallary();
  }
}
