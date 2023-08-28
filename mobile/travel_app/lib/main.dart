import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/global/locator.dart';

import 'core/global/providers.dart';
import 'core/global/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...viewModelProviders],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel',
          onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
          initialRoute: MyRouter.start,
        ),
      ),
    );
  }
}
