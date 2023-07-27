
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/services/auth_service.dart';
import 'app/theme/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // await Get.putAsync(
  //   () => AuthService().init(),
  // );


  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark // status bar color
      ));
      HttpOverrides.global = new PostHttpOverrides();
  runApp(MyApp());
}
class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient( context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    return ScreenUtilInit(
      designSize: Size(400.0, 634.6666666666666),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GeoSchool",
        initialRoute: AppPages.INITIAL,
        
        theme: Themes.light,

        getPages: AppPages.routes,
      ),
    );
  }

}

  
