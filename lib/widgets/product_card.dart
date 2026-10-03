import 'package:flutter/material.dart';

import '../models/products.dart';
import 'category_tag.dart';
import 'price_label.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap; // <-- tambahkan ini

  const ProductCard({
    super.key,
    required this.product,
    this.onTap, // <-- tambahkan ini
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    bool isDiscounted = widget.product is DiscountedProduct;

    return GestureDetector(
      // <-- bungkus dengan GestureDetector
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.product.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isDiscounted)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Diskon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: widget.product.stock > 0
                          ? Colors.green.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.product.getStatusStok(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTag(category: widget.product.category),
                  const SizedBox(height: 6),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  PriceLabel(price: widget.product.price),
                  const SizedBox(height: 6),
                  Text(
                    widget.product.description ?? 'Tidak ada deskripsi.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: widget.product.description == null
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
