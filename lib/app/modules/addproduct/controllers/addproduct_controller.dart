import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../db_service/DataBase_Helper.dart';
import '../../../model/product.dart';

class AddproductController extends GetxController {
  //TODO: Implement AddproductController

  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController offerPriceCtrl = TextEditingController();
  final TextEditingController availableQuantyCtrl = TextEditingController();
  final TextEditingController productDescriptionCtrl = TextEditingController();
  final dbHelper = DatabaseHelper();
  var productList = <Product>[].obs;
  RxString productName = "".obs;
  @override
  void onInit() {
    super.onInit();
    productName.value = Get.arguments?['productName'] ?? "";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Validator for name
  String? validateProductName(String value) {
    if (value.isEmpty) {
      return "Product Name can't be empty";
    }
    return null;
  }

  // Validator for email
  String? validatePrice(String value) {
    if (value.isEmpty) {
      return "Price Name can't be empty";
    }
    return null;
  }

  // Validator for password
  String? validateOfferPrice(String value) {
    if (value.isEmpty) {
      return "Offer price Name can't be empty";
    }
    return null;
  }

  String? validateQuantity(String value) {
    if (value.isEmpty) {
      return "Quantity cant be empty";
    }
    return null;
  }

  String? validateProductDescription(String value) {
    if (value.isEmpty) {
      return "Description Can't be empty";
    }
    return null;
  }

  Future<void> addProductSql() async {
    final DatabaseHelper _dbHelper = DatabaseHelper();
    await _dbHelper.addProduct(
        productName: productNameCtrl.text,
        price: priceCtrl.text,
        offerPrice: offerPriceCtrl.text,
        avlProductQty: availableQuantyCtrl.text,
        productDescription: productDescriptionCtrl.text);
  }

  // Load a product by name and add it to the productList
  Future<void> fetchProductByName(productName) async {
    final productMap = await dbHelper.getProductDetails(productName);
    if (productMap != null) {
      productList.add(Product.fromMap(productMap));
      productList.value.forEach((element) {
        productNameCtrl.text = element.productName!;
        priceCtrl.text = element.price!;
        offerPriceCtrl.text = element.offerPrice!;
        availableQuantyCtrl.text = element.avlProductQty!;
        productDescriptionCtrl.text = element.productDescription!;
      });
    }
  }

  Future<void> updateProduct() async {
    final updates = {
      'price': priceCtrl.text,
      'offerPrice': offerPriceCtrl.text,
      'avlProductQty': availableQuantyCtrl.text,
      'productDescription': productDescriptionCtrl.text,
    };

    int rowsAffected =
        await dbHelper.updateProductByName(productName.value, updates);
    if (rowsAffected > 0) {
      print('Product updated successfully');
    } else {
      print('No product found with the given name');
    }
  }
}
