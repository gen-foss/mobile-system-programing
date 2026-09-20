// lib/widgets/stock_badge.dart
import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final int stock;
  final String status;

  const StockBadge({super.key, required this.stock, required this.status});

  Color _getBadgeColor() {
    if (stock > 5) return Colors.green;
    if (stock > 0) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getBadgeColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
