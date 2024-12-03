import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../db_service/DataBase_Helper.dart';

class AddproductController extends GetxController {
  //TODO: Implement AddproductController

  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController offerPriceCtrl = TextEditingController();
  final TextEditingController availableQuantyCtrl = TextEditingController();
  final TextEditingController productDescriptionCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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
    await _dbHelper.addProduct(productName: productNameCtrl.text, price: priceCtrl.text,offerPrice: offerPriceCtrl.text,avlProductQty: availableQuantyCtrl.text,productDescription:productDescriptionCtrl.text);




  }
}
