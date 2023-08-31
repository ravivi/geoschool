import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geoschool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../component/search_form.dart';
import '../../../data/constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List cycles = [
    "CAP",
    "BEP",
    "BT",
    "BP",
    "BTS",
    "CQP",
    "Prépa-CAP",
    "Baccaleaureat",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeoSchool"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.VIEWMAP);
              },
              icon: Icon(Icons.map))
        ],
      ),
      body: Obx(
        () => (controller.isProblem.value)
            ? Container(
                height: Get.height,
                width: Get.width,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Icon(
                      Icons.wifi_off_outlined,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Une erreur est survenue",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Connectez-vous et réessayez.",
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // print("object");

                        controller.getschoolList();
                      },
                      child: Container(
                        width: 250.w,
                        height: 45.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Réessayer",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : LoadingOverlay(
                isLoading: controller.isLoading.value,
                opacity: 1,
                color: Colors.white,
                progressIndicator: SpinKitSpinningLines(
                  color: kPrimaryColor,
                  size: 80.0,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          width: Get.width - 100,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 233, 237),
                              borderRadius: BorderRadius.circular(15)),
                          child: Form(
                            child: TextFormField(
                              onChanged: (value) =>
                                  controller.filterschoolList(value),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Rechercher un etablissement ...",
                                  suffixIcon: Icon(Icons.search)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(Container(
                              padding: EdgeInsets.all(10),
                              height: Get.height / 1.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // padding: EdgeInsets.symmetric(vertical: 10),

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Cycle',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(Icons.close))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      for (var item
                                          in controller.filteredCycleList)
                                        ListTile(
                                          onTap: (){
                                            Get.toNamed(Routes.CYCLEPAGE);
                          
                                          },
                                          leading:
                                              Icon(Icons.dashboard_outlined),
                                          title: Text(
                                            item.libelleCycle.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                    ],
                                  ))
                                ],
                              ),
                            ));
                          },
                          child: Container(
                            height: 40.h,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    offset: Offset(0, 1),
                                    blurRadius: 5),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.filter_list_outlined,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    (controller.foundschoolList.isEmpty)
                        ? Text(
                            "Aucun element retrouvé",
                            style: TextStyle(
                                color: (controller.isLoading.value)
                                    ? Colors.white
                                    : Colors.black),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(
                                  decelerationRate:
                                      ScrollDecelerationRate.fast),
                              itemCount: controller.foundschoolList.length,
                              itemBuilder: (context, index) => Card(
                                elevation: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL,
                                        arguments:
                                            controller.foundschoolList[index]);
                                  },
                                  child: Container(
                                    // height: 80.h,
                                    width: Get.width,
                                    padding: EdgeInsets.all(2),
                                    margin: EdgeInsets.all(8),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80.h,
                                          width: 150.w,
                                          child: (controller
                                                          .foundschoolList[
                                                              index]
                                                          .logoEtab ==
                                                      "" ||
                                                  controller
                                                          .foundschoolList[
                                                              index]
                                                          .logoEtab ==
                                                      null)
                                              ? Image.asset("assets/not.jpg")
                                              : FadeInImage(
                                                  placeholder: AssetImage(
                                                      "assets/background.jpg"),
                                                  image: NetworkImage(
                                                      "https://inscriptions.etfp.ci//uploads/${controller.foundschoolList[index].logoEtab}"),
                                                ),
                                          // decoration: BoxDecoration(
                                          //     color: Colors.white,
                                          //     borderRadius:
                                          //         BorderRadius.circular(10),
                                          //     image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             "https://inscriptions.etfp.ci//uploads/${controller.foundschoolList[index].logoEtab}"),
                                          //         fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.foundschoolList[index]
                                                  .nomEtab,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: Get.width / 3,
                                                  child: Text(
                                                    (controller
                                                                    .foundschoolList[
                                                                        index]
                                                                    .cellulaireEtab ==
                                                                null ||
                                                            controller
                                                                    .foundschoolList[
                                                                        index]
                                                                    .cellulaireEtab ==
                                                                "")
                                                        ? "Pas d'adresse connu"
                                                        : "${controller.foundschoolList[index].adresseEtab}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10.sp),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  (controller
                                                                  .foundschoolList[
                                                                      index]
                                                                  .telephoneEtab ==
                                                              null ||
                                                          controller
                                                                  .foundschoolList[
                                                                      index]
                                                                  .telephoneEtab ==
                                                              "")
                                                      ? "Pas de numéro connu"
                                                      : "${controller.foundschoolList[index].telephoneEtab}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.sp),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.email_outlined,
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  (controller
                                                                  .foundschoolList[
                                                                      index]
                                                                  .emailEtab ==
                                                              null ||
                                                          controller
                                                                  .foundschoolList[
                                                                      index]
                                                                  .emailEtab ==
                                                              "")
                                                      ? "Pas d'email connu"
                                                      : "${controller.foundschoolList[index].emailEtab}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
      ),
    );
  }

}
