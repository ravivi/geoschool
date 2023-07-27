import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geoschool/app/modules/home/school_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/api_request.dart';

import '../../../routes/app_pages.dart';

import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  //TODO: Implement ProductlistController
  // AuthService authService = Get.find<AuthService>();

  RxList foundschoolList = <School>[].obs;
  String serverUrl = "https://inscriptions.etfp.ci/api";
  RxBool isLoading = false.obs;
  RxList<School> schoolList = <School>[].obs;
  RxBool isProblem = false.obs;




    RxList<School> establishments = <School>[].obs;
  RxString searchQuery = ''.obs;
  RxString selectedFiliere = ''.obs;
  RxString selectedNiveau = ''.obs;

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void setSelectedFiliere(String filiere) {
    selectedFiliere.value = filiere;
  }

  void setSelectedNiveau(String niveau) {
    selectedNiveau.value = niveau;
  }

  List<School> get filteredEstablishments {
    return establishments.where((establishment) {
      final filiereMatch = selectedFiliere.value.isEmpty || establishment.filieres!.contains(selectedFiliere.value);
      final cycleMatch = selectedNiveau.value.isEmpty || establishment.cycles!.contains(selectedNiveau.value);
      return filiereMatch || cycleMatch;
    }).toList();
  }


  @override
  void onInit() {
    print("object");

    getschoolList();
    foundschoolList.value = schoolList;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  formatDate(DateTime? date) {
    var formattedDate = DateFormat('d-MMM, yyyy').format(date!);
    return formattedDate;
  }
  //recuperation des schoolList

  getschoolList() async {
    isLoading(true);
    isProblem(false);
   
    try {
      final response = await ApiRequest().dio.get(
        "${serverUrl}/schools",
      );
      print(response.statusCode);
      var data = response.data;
      print(isLoading);

      if (response.statusCode == 200) {
        for (var item in data["query"]) {
          print("Premier visuel $schoolList");
          schoolList.add(School.fromJson(item));
          print("====================================");
          // print(schoolList[0].nomEtab);
          isLoading(false);
          isProblem(false);
        }
        print(data);
      } else {
        isLoading(false);
        print("Non non");
      }
    } on DioError catch (e) {
      isProblem(true);
      print("probleme ================== $isProblem+ $e");
    }
  }
  //recuperation des schoolList

  void filterschoolList(String name) {
    var results = [];
    if (name.isEmpty) {
      results = schoolList;
    } else {
      results = schoolList.where((element) {
        return element.nomEtab
            .toString()
            .toLowerCase()
            .contains(name.toLowerCase());
      }).toList();
    }
    foundschoolList.value = results;
  }

  // logout() async {

  //   authService.removeUser();

  //   Get.offAndToNamed(Routes.LOGIN);
  // }
}
