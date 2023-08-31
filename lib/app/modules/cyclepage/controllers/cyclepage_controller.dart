import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../providers/auth_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';


class CyclePageController extends GetxController {
  // String serverUrl = "https://e-maquis.herokuapp.com";
  String serverUrl = "http://54.86.9.155:3000";

  AuthProvider authProvider = Get.put(AuthProvider());
  AuthService authService = Get.find<AuthService>();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var status = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isProblem = false.obs;
  String message = '';
  var userData = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  login() async {
    isLoading(true);
    isProblem(false);
    print("Email:  ====> $email");
    print(password);

    bool emailValid = RegExp(
            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
        .hasMatch(email.text);

    print(emailValid);

    if (!emailValid) {
      Get.snackbar("Attention!!!", "Entrez un email correct",
          backgroundColor: Colors.orange.shade500,
          barBlur: 5,
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
          duration: Duration(seconds: 2));
      isLoading(false);
    } else {
      try {
        final response =
            await authProvider.login(email.text.trim(), password.text.trim());
        authService.storeUser(response);
        authService.getUserData();
        Get.offAllNamed(Routes.HOME);
      } on DioError catch (e) {
        isProblem(true);

        print("probleme ================== $isProblem+ $e");
        Get.snackbar("Attention!!!", "Une erreur est survenue",
            backgroundColor: Colors.red.shade500,
            barBlur: 5,
            isDismissible: true,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
            duration: Duration(seconds: 2));
      }
      isLoading(false);
    }
  }
}
