import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_pr/controllers/cart_controller.dart';

import '../../helpers/api_helper.dart';
import '../../models/product_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GetMaterial Store",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: const Alignment(6, -1.5),
                child: Obx(
                  () => Text(
                    CartController.cartItems.length.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              )
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.getApiData(),
        builder: (cnt, snp) {
          if (snp.hasError) {
            return Center(
              child: Text("Error :- ${snp.error.toString()}"),
            );
          } else if (snp.hasData) {
            List data = snp.data as List;

            List<Product> allProduct =
                data.map((e) => Product(data: e)).toList();

            return ListView(
              children: allProduct
                  .map((e) => Card(
                        elevation: 0,
                        child: ListTile(
                          leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                e.thumbnail!,
                                fit: BoxFit.cover,
                              )),
                          title: Text(e.title!),
                          subtitle: Text(e.price!.toString()),
                          trailing: GetX<CartController>(
                            builder: (controller) => IconButton(
                                onPressed: () {
                                  CartController.cartItems.contains(e)
                                      ? controller.removeToCart(product: e)
                                      : controller.addToCart(product: e);
                                },
                                icon: (CartController.cartItems.contains(e))
                                    ? const Icon(Icons.remove_shopping_cart)
                                    : const Icon(
                                        Icons.add_shopping_cart_outlined)),
                          ),
                          // trailing: IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(Icons.add_shopping_cart_outlined),
                          // ),
                        ),
                      ))
                  .toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.of(context).pushNamed('/detail');
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
