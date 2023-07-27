import 'package:get/get.dart';

import '../controllers/viewmap_controller.dart';

class ViewmapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewmapController>(
      () => ViewmapController(),
    );
  }
}
