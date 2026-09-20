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

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

void tampilkanDaftarProduk(List<Product> produk) {
  print('Daftar Produk:');
  for (var item in produk) {
    print('- ${item.name} (${item.id}): Rp ${item.price.toStringAsFixed(0)}');
  }
}

void tampilkanDaftarKeranjang(List<Product> produk) {
  print('Daftar Keranjang:');
  for (var item in produk) {
    print('- ${item.name} (${item.id}): Rp ${item.price.toStringAsFixed(0)}');
  }
}

// 8 Data Dummy
final List<Product> dummyProducts = [
  Product(
    id: 'PROD-001',
    name: 'Hydra',
    price: 450000000.0,
    imageUrl: 'https://static.wikia.nocookie.net/mrplotkinot/images/1/19/Hydra.gif/revision/latest?cb=20130410004516',
    category: 'Reptil',
    stock: 12,
    description: 'Naga berkepala 9',
  ),
  Product(
    id: 'PROD-002',
    name: 'Cerberus',
    price: 1750000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV4kRbzx53rlzkBLSVOBWpauzbO0IkQWO9FfcNIYKQNwUxzWIFRelF_Cw&s=10',
    category: 'Mamalia',
    stock: 4,
    description: 'Anjing berkepala 3 penjaga neraka',
  ),
  Product(
    id: 'PROD-003',
    name: 'Pegasus',
    price: 650000000.0,
    imageUrl: 'https://i.etsystatic.com/41596378/r/il/99de33/5598622928/il_fullxfull.5598622928_gb1x.jpg',
    category: 'Mamalia',
    stock: 25,
    description: 'Kuda bersayap yang bisa terbang',
  ),
  Product(
    id: 'PROD-004',
    name: 'Cyclops',
    price: 185000000.0,
    imageUrl: 'https://cdn.grid.id/crop/0x0:0x0/700x465/smart/filters:format(webp):blur(7):quality(50)/photo/2023/06/25/111cyclops-the-7th-voyage-of-sin-20230625092517.jpg',
    category: 'Mamalia',
    stock: 2,
    description: null, // Menguji properti nullable
  ),
  Product(
    id: 'PROD-005',
    name: 'Spynx',
    price: 750000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS466iNtkn_xvfE1barfNi7qRK6bpR6LQU1E-m433fPw5nkrd12wkIps4A&s=10',
    category: 'Mamalia',
    stock: 0,
    description: 'Kucing tanpa bulu, cocok untuk alergi',
  ),
  Product(
    id: 'PROD-006',
    name: 'Siren',
    price: 18000000.0,
    imageUrl: 'https://preview.redd.it/what-do-you-think-of-vodyanitsa-v0-oue9tendfejh1.png?auto=webp&s=2d5714da0022cf6a1d29167dea93bb269c266c85',
    category: 'Ikan',
    stock: 50,
    description: 'Renyah dengan bumbu cabai asli.',
  ),
  Product(
    id: 'PROD-007',
    name: 'Mermaid',
    price: 185000000.0,
    imageUrl: 'https://static.wikia.nocookie.net/spongebob/images/c/ca/Mermaid_Man_stock_art.png/revision/latest?cb=20220807020103',
    category: 'Ikan',
    stock: 3,
    description:
        'Duyung berkualitas tinggi eksklusif, cocok untuk koleksi pribadi.',
  ),
  Product(
    id: 'PROD-007',
    name: 'Timun laut',
    price: 185000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTd3NPJ45SvxvAdnUqaO9COukbnhhTCfE1gNMUVTWU1Wj5od2clsvwfA0&s=10',
    category: 'Ikan',
    stock: 3,
    description: 'Kevin si timun laut, legenda pemburu ubur-ubur',
  ),
  Product(
    id: 'PROD-008',
    name: 'Bahlil',
    price: 2100000000.0,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/40/Bahlil_Lahadalia%2C_Menteri_ESDM_%282024%29.jpg?utm_source=id.wikipedia.org&utm_campaign=index&utm_content=original',
    category: 'Mamalia',
    stock: 0,
    description: null,
  ),
];

void main() {
  List<Product> allProduct = [
    dummyProducts[0],
    dummyProducts[1],
    dummyProducts[2],
    dummyProducts[3],
    dummyProducts[4],
    dummyProducts[5],
    dummyProducts[6],
    dummyProducts[7],
    dummyProducts[8],
  ];
  List<Product> keranjang = [
    dummyProducts[0],
    dummyProducts[1],
    dummyProducts[6],
  ];

  tampilkanDaftarProduk(allProduct);
  print('-----------------------------------');
  tampilkanDaftarKeranjang(keranjang);
  print('-----------------------------------');
  double totalBelanja = hitungTotalBelanja(keranjang);
  print('Total Belanja: Rp ${totalBelanja.toStringAsFixed(0)}');
}
