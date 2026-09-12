import 'models/products.dart'; // Sesuaikan atau satukan file jika di DartPad

// Arrow function format rupiah
String formatRupiah(double nominal) => 'Rp ${nominal.toStringAsFixed(0)}';

// Function dengan named & optional parameter
double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0}) {
  return harga - (harga * (persenDiskon / 100));
}

// Function hitung total belanja
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

void main() {
  const String namaToko = 'TokoKita Official';
  final DateTime waktuBuka = DateTime.now();
  var totalKaryawan = 5;
  totalKaryawan = 6; // Valid

  // namaToko = 'Toko Baru'; // Error: const tidak bisa diubah nilainya
  // waktuBuka = DateTime.now(); // Error: final tidak bisa di-reassign

  int stokContoh = 15;
  double hargaContoh = 125000.50;
  String namaProdukContoh = 'Earphone TWS';
  bool statusTersedia = true;

  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> dataMentah = {
    'id': 'RAW-001',
    'nama': namaProdukContoh,
    'harga': hargaContoh,
    'stok': stokContoh,
    'tersedia': statusTersedia,
  };

  print('Toko: $namaToko, dibuka: $waktuBuka, Karyawan: $totalKaryawan');
  print('Produk: $namaProdukContoh, Harga: $hargaContoh, Stok: $stokContoh');
  print('Kategori: $daftarKategori');
  print('Data Mentah: $dataMentah\n');

  int jumlahBeli = 3;
  double subtotal = hargaContoh * jumlahBeli;
  int sisaStok = stokContoh - jumlahBeli;
  print('Subtotal ($jumlahBeli item): $subtotal');
  print('Sisa stok: $sisaStok');

  bool stokCukup = stokContoh >= jumlahBeli;
  bool layakTampil = stokContoh > 0 && hargaContoh > 0;
  print('Stok cukup: $stokCukup');
  print('Produk layak tampil: $layakTampil\n');

  // if-else
  String statusStok;
  if (stokContoh > 5) {
    statusStok = 'Tersedia';
  } else if (stokContoh > 0) {
    statusStok = 'Stok Terbatas';
  } else {
    statusStok = 'Habis';
  }
  print('Status stok: $statusStok');

  // for loop
  List<double> daftarHarga = [50000.0, 75000.0, 120000.0];
  double totalSimulasi = 0.0;
  for (var h in daftarHarga) {
    totalSimulasi += h;
  }
  print('Total simulasi for loop: $totalSimulasi');

  // while loop
  int stokJalan = 3;
  while (stokJalan > 0) {
    print('Mengurangi stok: sisa $stokJalan');
    stokJalan--;
  }

  // switch-case diskon kategori
  String kategoriCek = 'Fashion';
  double persentaseDiskon;
  switch (kategoriCek) {
    case 'Elektronik':
      persentaseDiskon = 10.0;
      break;
    case 'Fashion':
      persentaseDiskon = 15.0;
      break;
    case 'Makanan':
      persentaseDiskon = 5.0;
      break;
    default:
      persentaseDiskon = 0.0;
  }
  print('Diskon kategori $kategoriCek: $persentaseDiskon%\n');

  double hargaAsli = 200000.0;
  double hargaDiskon = hitungHargaSetelahDiskon(hargaAsli, persenDiskon: 20);
  print('Harga asli: ${formatRupiah(hargaAsli)}');
  print('Setelah diskon 20%: ${formatRupiah(hargaDiskon)}');

  // Instance Product & DiscountedProduct
  var p1 = dummyProducts[0];
  var promoP = DiscountedProduct(
    id: 'DISC-01',
    name: 'Powerbank 20000mAh',
    price: 300000.0,
    imageUrl: 'https://placehold.co/150',
    category: 'Elektronik',
    stock: 5,
    discountPercent: 25.0,
  );

  print(
    'Produk 1: ${p1.name} | Status: ${p1.getStatusStok()} | Ket: ${p1.description ?? "Tanpa deskripsi"}',
  );
  print(
    'Produk Promo: ${promoP.name} | Harga Awal: ${formatRupiah(promoP.price)} | Final: ${formatRupiah(promoP.finalPrice)}',
  );

  // Total Belanja
  List<Product> keranjangBelanja = [dummyProducts[0], dummyProducts[2]];
  print(
    '\nTotal Belanja Keranjang: ${formatRupiah(hitungTotalBelanja(keranjangBelanja))}',
  );
}
