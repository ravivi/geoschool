
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';



class SplashView extends GetView<SplashController> {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff343434),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height/3,),

              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        offset: Offset.zero,
                        blurRadius: 20.0,
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 20,),
              
              Text(
                "E-maquis",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
             SpinKitCubeGrid(
                    size: 30,
                    color: Colors.orange,
                  ),
            ],
          ),
        ));
  }
}
