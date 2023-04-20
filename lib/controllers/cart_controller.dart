import 'package:get/get.dart';
import 'package:getx_pr/models/product_modal.dart';

class CartController extends GetxController {
  static RxList<Product> cartItems = <Product>[].obs;
  RxInt totalAmount = 0.obs;

  addToCart({required Product product}) {
    if (cartItems.contains(product)) {
      Get.snackbar(product.title!, "Already in cart !!");
    } else {
      cartItems.add(product);
    }
  }

  removeToCart({required Product product}) {
    if (cartItems.remove(product)) {
      Get.snackbar(product.title!, "Remove from Cart !! ");
    }
  }

  addQuantity({required Product product}) {
    cartItems[cartItems.indexOf(product)].quantity++;
    getTotalAmount();
  }

  decreaseQuantity({required Product product}) {
    if (product.quantity > 1) {
      cartItems[cartItems.indexOf(product)].quantity--;
    } else {
      removeToCart(product: product);
    }
    getTotalAmount();
  }

  getTotalAmount() {
    RxInt amount = 0.obs;
    cartItems.forEach((element) {
      amount += (element.price! * element.quantity.toInt());
    });
    totalAmount = amount;
    print(totalAmount.toString());
  }
}
