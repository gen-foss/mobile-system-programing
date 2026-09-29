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
  double get finalPrice => price - (price * discountPercent / 100);
}

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

final List<Product> dummyProducts = [
  Product(
    id: 'PROD-001',
    name: 'Hydra',
    price: 450000000.0,
    imageUrl:
        'https://static.wikia.nocookie.net/mrplotkinot/images/1/19/Hydra.gif',
    category: 'Reptil',
    stock: 12,
    description: 'Naga berkepala 9',
  ),
  DiscountedProduct(
    id: 'PROD-002',
    name: 'Cerberus',
    price: 1750000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV4kRbzx53rlzkBLSVOBWpauzbO0IkQWO9FfcNIYKQNwUxzWIFRelF_Cw&s=10',
    category: 'Mamalia',
    stock: 4,
    description: 'Anjing berkepala 3 penjaga neraka',
    discountPercent: 15.0,
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
    description: 'makhluk berbadan singa dengan kepala manusia',
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
  DiscountedProduct(
    id: 'PROD-007',
    name: 'Mermaid',
    price: 185000000.0,
    imageUrl: 'https://static.wikia.nocookie.net/spongebob/images/c/ca/Mermaid_Man_stock_art.png',
    category: 'Ikan',
    stock: 3,
    description:
        'Duyung berkualitas tinggi eksklusif, cocok untuk koleksi pribadi.',
    discountPercent: 50.0,
  ),
  Product(
    id: 'PROD-008',
    name: 'Timun laut',
    price: 185000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTd3NPJ45SvxvAdnUqaO9COukbnhhTCfE1gNMUVTWU1Wj5od2clsvwfA0&s=10',
    category: 'Ikan',
    stock: 3,
    description: 'Kevin si timun laut, legenda pemburu ubur-ubur',
  ),
  Product(
    id: 'PROD-009',
    name: 'Kitsune',
    price: 2100000000.0,
    imageUrl: 'https://cdng.europosters.eu/pod_public/1300/249901.png',
    category: 'Mamalia',
    stock: 0,
    description: null,
  ),
  Product(
    id: 'PROD-010',
    name: 'Kraken',
    price: 850000000.0,
    imageUrl: 'https://cdn1-production-images-kly.akamaized.net/PK_9ae2ydXZOKfH2wddhGy5BmT4=/1280x720/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2514221/original/023041900_1543837613-Kraken.jpg',
    category: 'Mollusca',
    stock: 1,
    description: 'Gurita raksasa penghancur kapal bajak laut.',
  ),
  DiscountedProduct(
    id: 'PROD-011',
    name: 'Jormungandr',
    price: 5000000000.0,
    imageUrl: 'https://i.pinimg.com/736x/15/2f/91/152f91c7b7c4919108c4254929238fd6.jpg',
    category: 'Reptil',
    stock: 1,
    description: 'Ular raksasa legendaris.',
    discountPercent: 10.0,
  ),
  Product(
    id: 'PROD-012',
    name: 'Kucing Oren',
    price: 50000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1p6ch6XRV5VGv13t04x0BVvG_8vIECQwKBgI6WdjP2E4h6OQFx8amkg0&s=10',
    category: 'Mamalia',
    stock: 99,
    description: 'Ras terkuat di bumi',
  ),
  Product(
    id: 'PROD-013',
    name: 'Wyvern',
    price: 120000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRi8Eq6m7Bc0NlDp_nZF5FM4H3h9kQv81dFdFxr5OzVt5Mx1Y9A4Wtjbc&s=10',
    category: 'Reptil',
    stock: 0,
    description: 'Mirip naga, tapi cuma punya 2 kaki dan sayap.',
  ),
  Product(
    id: 'PROD-014',
    name: 'Leviathan',
    price: 900000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDdZD8RDFySrJkKUEseLPaoKEE01hNve3csKLzpzseGQ&s',
    category: 'Ikan',
    stock: 2,
    description: 'Monster laut raksasa pembawa badai.',
  ),
  DiscountedProduct(
    id: 'PROD-015',
    name: 'Chupacabra',
    price: 15000000.0,
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpyMhouWVyhJ1DHX3cgntR3zXtuy7AeftrmjerLtXrAw&s=10',
    category: 'Mamalia',
    stock: 5,
    description: 'Pemakan ternak handal dari Amerika Latin.',
    discountPercent: 20.0,
  ),
];
