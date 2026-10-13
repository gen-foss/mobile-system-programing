import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/products.dart';
import 'main_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Pesanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];
                    return ListTile(
                      title: Text(item.product.name),
                      subtitle: Text('Jumlah: ${item.quantity}'),
                      trailing: Text(
                        'Rp ${(item.product is DiscountedProduct ? (item.product as DiscountedProduct).finalPrice : item.product.price) * item.quantity}',
                      ),
                    );
                  },
                );
              }),
            ),
            const Divider(),
            Obx(
              () => Text(
                'Total: Rp ${cartController.totalHarga.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  cartController.clearCart();
                  Get.offAll(() => const MainPage());
                  Get.snackbar(
                    'Sukses',
                    'Pesanan berhasil dibuat!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
