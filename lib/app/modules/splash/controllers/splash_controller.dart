
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_service.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  AuthService authService = Get.find<AuthService>();

  final count = 0.obs;
  @override
  void onInit() {
    redirect();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  redirect() {
    Future.delayed(Duration(seconds: 2), () {
      // Get.offAllNamed(
      //     authService.getUserData() == null ? Routes.LOGIN : Routes.HOME);
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
