// lib/models/product.dart

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  final String? description; // Nullable: boleh kosong

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  // Method untuk menentukan status ketersediaan barang
  String getStatusStok() {
    if (stock > 5) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }
}

// Inheritance sederhana untuk produk diskon
class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  // Getter untuk menghitung harga setelah dipotong diskon
  double get finalPrice => price - (price * discountPercent / 100);
}

// 8 Data Dummy
final List<Product> dummyProducts = [
  Product(
    id: 'PROD-001',
    name: 'Keyboard Mechanical TKL',
    price: 450000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Elektronik',
    stock: 12,
    description: 'Switch Outemu Blue dengan backlit RGB.',
  ),
  Product(
    id: 'PROD-002',
    name: 'Mouse Wireless Silent',
    price: 175000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Elektronik',
    stock: 4,
    description: 'Koneksi 2.4GHz dan Bluetooth ganda.',
  ),
  Product(
    id: 'PROD-003',
    name: 'Kaos Polos Cotton Combed 30s',
    price: 65000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Fashion',
    stock: 25,
    description: 'Bahan adem dan menyerap keringat.',
  ),
  Product(
    id: 'PROD-004',
    name: 'Celana Chino Slim Fit',
    price: 185000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Fashion',
    stock: 2,
    description: null, // Menguji properti nullable
  ),
  Product(
    id: 'PROD-005',
    name: 'Kopi Arabika Gayo 250g',
    price: 75000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Makanan',
    stock: 0,
    description: 'Biji kopi pilihan roasted medium-dark.',
  ),
  Product(
    id: 'PROD-006',
    name: 'Keripik Singkong Balado',
    price: 18000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Makanan',
    stock: 50,
    description: 'Renyah dengan bumbu cabai asli.',
  ),
  Product(
    id: 'PROD-007',
    name: 'Monitor Gaming 24 Inci 144Hz',
    price: 1850000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Elektronik',
    stock: 3,
    description: 'Panel IPS dengan respons 1ms.',
  ),
  Product(
    id: 'PROD-008',
    name: 'Jaket Hoodie Fleece',
    price: 210000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Fashion',
    stock: 0,
    description: null,
  ),
];
