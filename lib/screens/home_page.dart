import 'package:flutter/material.dart';

import '../models/products.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'TokoKita',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Belanja jadi lebih mudah',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return ProductCard(
            product: product,
            onTap: () async {
              // Menggunakan named route + mengirim data
              final result = await Navigator.pushNamed(
                context,
                '/detail',
                arguments: product,
              );

              // Menampilkan SnackBar jika ada nilai yang dikembalikan
              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Berhasil menambahkan $result item ke keranjang!',
                    ),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
