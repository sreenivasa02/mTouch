import 'package:get/get.dart';

import '../controllers/productlistview_controller.dart';

class ProductlistviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductlistviewController>(
      () => ProductlistviewController(),
    );
  }
}
