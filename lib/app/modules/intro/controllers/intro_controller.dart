import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../../../routes/app_pages.dart';

import '../../../services/auth_service.dart';


class IntroController extends GetxController {
  //TODO: Implement ProductlistController
    AuthService authService = Get.find<AuthService>();

  RxList<dynamic> foundCategory = [].obs;
  String serverUrl = "http://54.86.9.155:3000";
  RxBool isLoading = false.obs;
  RxList category = [].obs;
  RxBool isProblem = false.obs;


  @override
  void onInit() {
    print("object");

    getCategory();
    foundCategory.value = category;

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
  //recuperation des category

  getCategory() async {
    var formData = {
      'id': authService.user_data.value.employelogin!.travailPour,
    };
    isLoading(true);
    isProblem(false);
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      baseUrl: "${serverUrl}/categorie_par_client",
      headers: {
        'Accept': 'application/json',
      },
      followRedirects: false,
    );
    Dio dio = new Dio(options);
    try {
      final response = await dio.post(
        "${serverUrl}/categorie_par_client",
        data: formData,
      );
      print(response.statusCode);
      var data = response.data;
      print(isLoading);

      if (response.statusCode == 200) {
        for (var item in data["data"]["resultat"]) {
          print("Premier visuel $category");
          // category.add(Category.fromJson(item));
          print("deuxième visuel $category");
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
  //recuperation des category


  void filterCategory(String name) {
    var results = [];
    if (name.isEmpty) {
      results = category;
    } else {
      results = category.where((element) {
        return element.nom
            .toString()
            .toLowerCase()
            .contains(name.toLowerCase());
      }).toList();
    }
    foundCategory.value = results;
  }

  logout() async {
   
    authService.removeUser();

    // Get.offAndToNamed(Routes.LOGIN);
  }
}
