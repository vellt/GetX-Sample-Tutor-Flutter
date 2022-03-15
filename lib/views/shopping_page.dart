import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutr/controllers/cart_controller.dart';
import 'package:getx_tutr/controllers/shopping_contrtoller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.products[index].productName}",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    "${controller.products[index].productDescription}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToCart(controller.products[index]);
                            },
                            child: Text("Add to cart"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              "Total amount: \$ ${controller.totalPrice}",
              style: TextStyle(fontSize: 20),
            );
          }),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
        label: GetX<CartController>(builder: (controller) {
          return Text('${controller.count}');
        }),
      ),
    );
  }
}
