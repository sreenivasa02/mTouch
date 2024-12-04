import 'package:get/get.dart';

import '../../../db_service/DataBase_Helper.dart';
import '../../../model/product.dart';

class ProductlistviewController extends GetxController {
  //TODO: Implement ProductlistviewController

  final count = 0.obs;
  final products = <Product>[].obs; // Observable list of products
  final dbHelper = DatabaseHelper();
  var productList = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchProducts() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> productMaps = await db.query('product');
    products.value = productMaps.map((map) => Product.fromMap(map)).toList();
  }
  Future<void> deleteProduct(String productName) async {
    await dbHelper.deleteProductByName(productName);
    fetchProducts(); // Refresh the list after deletion
  }



}
