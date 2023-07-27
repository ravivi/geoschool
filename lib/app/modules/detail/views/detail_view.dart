import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geoschool/app/modules/home/school_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../data/constant.dart';
import '../controllers/detail_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetailView extends GetView<DetailController> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.343924, -4.0645722),
    zoom: 10,
  );
  PageController carouselController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.school.nomEtab}"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    height: Get.height / 3,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: (controller.school.picture1 != null ||
                            controller.school.picture2 != null ||
                            controller.school.picture3 != null)
                        ? PageView(
                            controller: carouselController,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                height: Get.height / 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://inscriptions.etfp.ci/uploads/${controller.school.picture1}"),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                height: Get.height / 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://inscriptions.etfp.ci/uploads/${controller.school.picture2}"),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                height: Get.height / 3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://inscriptions.etfp.ci/uploads/${controller.school.picture3}"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          )
                        : Container(
                            child: Text(
                            "Pas d'images disponible",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          ))),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            (controller.school.picture1 != null ||
                    controller.school.picture2 != null ||
                    controller.school.picture3 != null)
                ? Center(
                    child: SmoothPageIndicator(
                      controller: carouselController,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: JumpingDotEffect(
                          spacing: 8.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: kPrimaryColor),
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Adresse: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          (controller.school.adresseEtab == null ||
                                  controller.school.adresseEtab == "")
                              ? "Pas d'adresse connu"
                              : "${controller.school.adresseEtab}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (controller.school.emailEtab == null ||
                                controller.school.emailEtab == "")
                            ? "Pas d'email connu"
                            : "${controller.school.emailEtab}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Téléphone: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          (controller.school.telephoneEtab == null ||
                                  controller.school.telephoneEtab == "")
                              ? "Pas de telephone connu"
                              : "${controller.school.telephoneEtab}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: Get.height / 4,
                    width: Get.width,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(.6),
                        borderRadius: BorderRadius.circular(10)),
                    child: GoogleMap(
                      markers: {
                        Marker(
                          //add first marker
                          markerId: MarkerId(LatLng(
                                  controller.school.longitude!,
                                  controller.school.latitude!)
                              .toString()),
                          position: LatLng(controller.school.longitude!,
                              controller.school.latitude!), //position of marker

                          infoWindow: InfoWindow(
                            //popup info
                            title: controller.school.nomEtab,
                          ),
                          icon:
                              BitmapDescriptor.defaultMarker, //Icon for Marker
                        ),
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(controller.school.longitude!,
                            controller.school.latitude!),
                        zoom: 10,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Formation ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: Get.height / 5, maxHeight: Get.height/4),
                    child: ExpandableTheme(
                      data: ExpandableThemeData(
                        iconColor: kPrimaryColor,
                        useInkWell: true,
                      ),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: <Widget>[
                          (!controller.cap.isEmpty)
                              ? Card1(
                                  cycle:
                                      "Certificat d'Aptitude Professionnelle (CAP)",
                                  list: controller.cap,
                                )
                              : Container(),
                          (!controller.bep.isEmpty)
                              ? Card1(
                                  cycle: "Brevet d'Etude Professionnelle (BEP)",
                                  list: controller.bep,
                                )
                              : Container(),
                          (!controller.bt.isEmpty)
                              ? Card1(
                                  cycle: "Brevet de Technicien(BT)",
                                  list: controller.bt,
                                )
                              : Container(),
                          (!controller.bp.isEmpty)
                              ? Card1(
                                  cycle: "Brevet Professionnel(BP)",
                                  list: controller.bp,
                                )
                              : Container(),
                          (!controller.bts.isEmpty)
                              ? Card1(
                                  cycle: "Brevet de Technicien Supérieur (BTS)",
                                  list: controller.bts,
                                )
                              : Container(),
                          (!controller.cqp.isEmpty)
                              ? Card1(
                                  cycle:
                                      "Certificat de Qualification Professionnelle(CQP)",
                                  list: controller.cqp,
                                )
                              : Container(),
                          (!controller.pcap.isEmpty)
                              ? Card1(
                                  cycle: " 	Prépa-CAP",
                                  list: controller.cqp,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: ExpandableThemeData(
          iconColor: kPrimaryColor,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            // Card1(),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String cycle;
  final List<Filiere> list;

  const Card1({
    super.key,
    required this.cycle,
    required this.list,
  });
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    cycle,
                  )),
              collapsed: Container(),
              expanded: Wrap(
                spacing: 20.0,
                children: <Widget>[
                  for (var item in list)
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Card(
                          child: Container(
                         height: 50.h,
                        width: 150.w,
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          item.libelleFiliere.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
