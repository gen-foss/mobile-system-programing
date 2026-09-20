import 'package:flutter_test/flutter_test.dart';
// Sesuaikan nama package dengan nama proyek di pubspec.yaml Anda
import 'package:flutter_test1/main.dart';

void main() {
  testWidgets('Memastikan Katalog TokoKita berhasil dimuat', (
    WidgetTester tester,
  ) async {
    // Membangun aplikasi TokoKita
    await tester.pumpWidget(const TokoKitaApp());

    // Memverifikasi teks judul pada AppBar muncul
    expect(find.text('Katalog TokoKita'), findsOneWidget);
  });
}
