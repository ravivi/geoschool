import 'package:dio/dio.dart';
import 'package:geoschool/app/modules/home/controllers/home_controller.dart';
import 'package:geoschool/app/routes/app_pages.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../services/auth_service.dart';


class ViewmapController extends GetxController {
  //TODO: Implement ProductlistController
 

  HomeController _homeController = Get.find();

      final Set<Marker> markers = new Set();


  @override
  void onInit() {
createMap();
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {}

  createMap(){
    for (var mapElement in _homeController.schoolList) {
      print(mapElement);
      if (mapElement.latitude!=null &&mapElement.longitude!=null) {
         markers.add(
        
         Marker( //add first marker
        markerId: MarkerId(LatLng(mapElement.longitude!, mapElement.latitude!).toString()),
        position: LatLng(mapElement.longitude!, mapElement.latitude!), //position of marker

        infoWindow: InfoWindow( //popup info 
          title: mapElement.nomEtab,
          onTap: () {
            Get.toNamed(Routes.DETAIL, arguments: mapElement);

          },
          

          
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ),
      );
     
      } else {
        
         Container();
     
      }
      
    }
  }

}
