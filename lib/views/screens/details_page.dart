import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_pr/controllers/cart_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    cartController.getTotalAmount();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: Obx(() => ListView(
            children: [
              ...CartController.cartItems
                  .map((product) => Card(
                        elevation: 0,
                        child: ListTile(
                          leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                product.thumbnail!,
                                fit: BoxFit.cover,
                              )),
                          title: Text(product.title!),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    cartController.decreaseQuantity(
                                        product: product);
                                  },
                                  icon: const Icon(Icons.remove)),
                              Text(product.quantity!.toString()),
                              IconButton(
                                  onPressed: () {
                                    cartController.addQuantity(
                                        product: product);
                                  },
                                  icon: const Icon(Icons.add)),
                              IconButton(
                                  onPressed: () {
                                    cartController.removeToCart(
                                        product: product);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.grey.shade300,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Text("TotalAmount :"),
                    const Spacer(),
                    Text(cartController.totalAmount.toString()),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
