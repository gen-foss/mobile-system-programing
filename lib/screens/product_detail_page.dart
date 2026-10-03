import 'package:flutter/material.dart';
import '../models/products.dart';
import '../widgets/category_tag.dart';
import '../widgets/price_label.dart';
import '../widgets/stock_badge.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final bool isDiscounted = product is DiscountedProduct;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nama & Kategori
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            CategoryTag(category: product.category),
            const SizedBox(height: 12),

            // Harga
            if (isDiscounted) ...[
              Text(
                'Rp ${product.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              PriceLabel(price: (product as DiscountedProduct).finalPrice),
            ] else
              PriceLabel(price: product.price),

            const SizedBox(height: 12),

            // Status Stok
            StockBadge(
              stock: product.stock,
              status: product.getStatusStok(),
            ),
            const SizedBox(height: 16),

            // Deskripsi
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              product.description ?? 'Tidak ada deskripsi.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            // Jumlah
            Row(
              children: [
                const Text(
                  'Jumlah:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                IconButton(
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tombol Tambah ke Keranjang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: product.stock > 0
                    ? () {
                        // Mengembalikan jumlah ke halaman sebelumnya
                        Navigator.pop(context, quantity);
                      }
                    : null,
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}