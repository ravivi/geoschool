import 'package:get/get.dart';

import '../controllers/cyclepage_controller.dart';

class CyclePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CyclePageController>(
      () => CyclePageController(),
    );
  }
}
