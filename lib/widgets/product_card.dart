// lib/widgets/product_card.dart
import 'package:flutter/material.dart';

import '../models/products.dart';
import 'category_tag.dart';
import 'price_label.dart';
import 'stock_badge.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('[LIFECYCLE] initState() dipanggil untuk: ${widget.product.name}');
  }

  @override
  void dispose() {
    print('[LIFECYCLE] dispose() dipanggil untuk: ${widget.product.name}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
      '[LIFECYCLE] build() dipanggil untuk: ${widget.product.name} (Favorite: $_isFavorite)',
    );

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= KOLOM KIRI =================
            // Gambar produk, lalu nama dan harga di bawahnya
            SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.product.imageUrl,
                      width: 110,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 110,
                        height: 100,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  PriceLabel(price: widget.product.price),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // ================= KOLOM KANAN =================
            // Kategori, badge stok, deskripsi produk, dan tombol favorit
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris Kategori & Status Stok
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CategoryTag(category: widget.product.category),
                      StockBadge(
                        stock: widget.product.stock,
                        status: widget.product.getStatusStok(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Label dan Teks Deskripsi Produk
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.product.description ??
                        'Tidak ada deskripsi untuk produk ini.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: widget.product.description == null
                          ? Colors.grey
                          : Colors.black87,
                      fontStyle: widget.product.description == null
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // Tombol Favorit di pojok kanan bawah kartu
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                        print(
                          '[ACTION] Tombol favorit ${widget.product.name} ditekan -> Status: $_isFavorite',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
