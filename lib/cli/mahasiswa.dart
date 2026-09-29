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
Data Mahasiswa
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
  Mahasiswa mhs = Mahasiswa(
    nim: '12345678',
    nama: 'Andi Pratama',
    alamat: 'Jl. Sudirman No. 5',
    email: 'andi@example.com',
    hobi: 'Membaca',
  );
  print(mhs.getInfo('12345678'));
  print(mhs.getInfo('87654321'));
}
