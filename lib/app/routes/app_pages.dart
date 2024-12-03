import 'package:get/get.dart';

import '../modules/addproduct/bindings/addproduct_binding.dart';
import '../modules/addproduct/views/addproduct_view.dart';
import '../modules/productlistview/bindings/productlistview_binding.dart';
import '../modules/productlistview/views/productlistview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCTLISTVIEW;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCTLISTVIEW,
      page: () => ProductlistviewView(),
      binding: ProductlistviewBinding(),
    ),
    GetPage(
      name: _Paths.ADDPRODUCT,
      page: () => const AddproductView(),
      binding: AddproductBinding(),
    ),
  ];
}
