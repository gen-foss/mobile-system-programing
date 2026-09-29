import 'dart:io';

class Mahasiswa {
  String nim;
  String nama;
  String alamat;
  String email;
  String? hobi;
  String? telepon;
  double ipk = 0;

  Mahasiswa({
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.email,
    this.hobi,
    this.telepon,
  });

  String? getInfo(String inputNim) {
    if (nim == inputNim) {
      return '''
--- Data Mahasiswa ---
NIM     : $nim
Nama    : $nama
Alamat  : $alamat
Email   : $email
Hobi    : ${hobi ?? '-'}
Telepon : ${telepon ?? '-'}
IPK     : $ipk''';
    } else {
      return 'Mahasiswa dengan NIM $inputNim tidak ditemukan.';
    }
  }
}

void main() {
  List<Mahasiswa> daftarMahasiswa = [];
  bool lanjutInput = true;

  print('=== PROGRAM INPUT BANYAK MAHASISWA ===\n');

  while (lanjutInput) {
    print('--- Masukkan Data Mahasiswa ke-${daftarMahasiswa.length + 1} ---');

    // Input data wajib
    stdout.write('NIM     : ');
    String nim = stdin.readLineSync() ?? '';

    stdout.write('Nama    : ');
    String nama = stdin.readLineSync() ?? '';

    stdout.write('Alamat  : ');
    String alamat = stdin.readLineSync() ?? '';

    stdout.write('Email   : ');
    String email = stdin.readLineSync() ?? '';

    // Input data opsional
    stdout.write('Hobi (opsional, tekan Enter jika kosong)    : ');
    String? hobiInput = stdin.readLineSync();
    String? hobi = (hobiInput != null && hobiInput.trim().isNotEmpty)
        ? hobiInput
        : null;

    stdout.write('Telepon (opsional, tekan Enter jika kosong) : ');
    String? telpInput = stdin.readLineSync();
    String? telepon = (telpInput != null && telpInput.trim().isNotEmpty)
        ? telpInput
        : null;

    // Simpan ke dalam List
    daftarMahasiswa.add(
      Mahasiswa(
        nim: nim,
        nama: nama,
        alamat: alamat,
        email: email,
        hobi: hobi,
        telepon: telepon,
      ),
    );

    // Konfirmasi apakah ingin menambah lagi
    stdout.write('\nIngin menambah mahasiswa lagi? (y/n): ');
    String? konfirmasi = stdin.readLineSync()?.toLowerCase().trim();

    if (konfirmasi != 'y') {
      lanjutInput = false;
    }
    print(''); // Baris baru sebagai pemisah antarsesi
  }

  // Menampilkan seluruh data yang telah tersimpan
  print('=======================================');
  print('TOTAL MAHASISWA TERCATAT: ${daftarMahasiswa.length}');
  print('=======================================');

  for (var mhs in daftarMahasiswa) {
    print(mhs.getInfo(mhs.nim));
    print('---------------------------------------');
  }
}
