import 'package:flutter/material.dart';
import 'package:geoschool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/search_form.dart';
import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/back.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.7), BlendMode.darken))),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 3,
            ),
            Text(
              "Geoschool",
              style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Votre annuaire digitale qui vous permet de connaitre tous les etablissements du MINISTERE DE L’ENSEIGNEMENT TECHNIQUE, FORMATION PROFESSIONNELLE ET APPRENTISSAGE (METFPA)",
              style: TextStyle(
                  fontSize: 10.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Get.height / 4,
            ),
            InkWell(
              onTap: (){
                Get.offAndToNamed(Routes.HOME);
              },
                child: CircleAvatar(
              maxRadius: 30,
              child: Icon(Icons.arrow_forward_ios),
            ))
          ],
        ),
      ),
    );
  }
}
