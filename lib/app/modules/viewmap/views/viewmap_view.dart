import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../main.dart';
import '../../../component/search_form.dart';
import '../../../routes/app_pages.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controllers/viewmap_controller.dart';

class ViewmapView extends GetView<ViewmapController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
      final Set<Marker> markers = new Set();
      

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(7.7005203,-5.160919),
    zoom: 6.6,
  );


  static const CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(5.3729292, -4.0067504),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carte"),
      ),
      body: GoogleMap(
        markers: controller.markers,
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

}
