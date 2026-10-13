import 'package:get/get.dart';

import '../models/products.dart';

class CartItem {
  final Product product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});
}

class CartController extends GetxController {
  final cartItems = <CartItem>[].obs;

  int get totalItem => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalHarga {
    return cartItems.fold(0.0, (sum, item) {
      double harga = item.product is DiscountedProduct
          ? (item.product as DiscountedProduct).finalPrice
          : item.product.price;
      return sum + (harga * item.quantity);
    });
  }

  void addToCart(Product product, {int quantity = 1}) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      cartItems[index].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }

    Get.snackbar(
      'Berhasil',
      '${product.name} ditambahkan ke keranjang',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void updateQuantity(Product product, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (newQuantity <= 0) {
        removeFromCart(product);
      } else {
        cartItems[index].quantity = newQuantity;
        cartItems.refresh();
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}
