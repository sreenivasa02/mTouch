import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_touch_app/app/modules/productlistview/views/productlistview_view.dart';

import '../controllers/addproduct_controller.dart';

class AddproductView extends GetView<AddproductController> {
  const AddproductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddproductController addproductController = Get.put(AddproductController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddproductView'),
          centerTitle: true,
        ),
        body: Obx(
          () => Container(
            height: Get.height / 2,
            child: Form(
              key: addproductController.formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text('Product Name'),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: Get.width / 2,
                            child: TextFormField(
                              controller: controller.productNameCtrl,
                              // The validator receives the text that the user has entered.
                              validator: (value) =>
                                  controller.validateProductName(value!),
                              //controller: ,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text('Price'),
                        ),
                        SizedBox(
                          width: Get.width / 2,
                          child: TextFormField(
                            controller: controller.priceCtrl,
                            // The validator receives the text that the user has entered.
                            validator: (value) =>
                                controller.validatePrice(value!),
                            //controller: ,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text('Offer price'),
                        ),
                        SizedBox(
                          width: Get.width / 2,
                          child: TextFormField(
                            controller: controller.offerPriceCtrl,
                            // The validator receives the text that the user has entered.
                            validator: (value) =>
                                controller.validateOfferPrice(value!),
                            //controller: ,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text('Available quantity'),
                        ),
                        SizedBox(
                          width: Get.width / 2,
                          child: TextFormField(
                            controller: controller.availableQuantyCtrl,
                            // The validator receives the text that the user has entered.
                            validator: (value) =>
                                controller.validateQuantity(value!),
                            //controller: ,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text('Product description.'),
                        ),
                        SizedBox(
                          width: Get.width / 2,
                          child: TextFormField(
                            controller: controller.productDescriptionCtrl,
                            // The validator receives the text that the user has entered.
                            validator: (value) =>
                                controller.validateProductDescription(value!),
                            //controller: ,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    addproductController.productName.toString().isNotEmpty
                        ? ElevatedButton(
                            onPressed: () async {
                              if (addproductController.formKey.currentState!
                                  .validate()) {
                                await controller.updateProduct();

                                Get.offAllNamed('/productlistview');
                              }
                            },
                            child: Text("Update"),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              if (addproductController.formKey.currentState!
                                  .validate()) {
                                await controller.addProductSql();

                                Get.offAllNamed('/productlistview');
                              }
                            },
                            child: Text("Submit"),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
