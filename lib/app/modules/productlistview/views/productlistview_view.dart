import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_touch_app/app/modules/addproduct/controllers/addproduct_controller.dart';
import 'package:m_touch_app/app/modules/addproduct/views/addproduct_view.dart';

import '../controllers/productlistview_controller.dart';

class ProductlistviewView extends GetView<ProductlistviewController> {
   ProductlistviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductlistviewController productlistviewController=Get.put(ProductlistviewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Obx(() {
        if (productlistviewController.products.isEmpty) {
          return Center(child: Text('No products available.'));
        }
        return ListView.builder(
          itemCount: productlistviewController.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Card(
              child: ListTile(
                onTap: (){
                  Get.to(AddproductView());
                },
                title: Text(product.productName ?? ''),
                subtitle: Row(
                  children: [
                    Text('Price: ${product.price ?? 'N/A'}'),
                    SizedBox(width: 20,),
                    Text('Quantity: ${product.avlProductQty ?? 'N/A'}'),
                    SizedBox(width: 20,),
                    Text('Offer: ${product.offerPrice ?? 'N/A'}')
                  ],
                ),
                trailing:  IconButton(onPressed: (){
                  productlistviewController.deleteProduct(product!.productName.toString());
                }, icon: Icon(Icons.delete)),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=>Get.to(AddproductView()), label: Text("Add Product")),

    );
  }
}
