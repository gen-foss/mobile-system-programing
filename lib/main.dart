import 'package:flutter/material.dart';

import 'models/products.dart';
import 'screens/home_page.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Halaman awal menggunakan Bottom Navigation
      home: const MainPage(),

      // Named routes
      routes: {
        '/home': (context) => const HomePage(),
        '/detail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailPage(product: product);
        },
      },
    );
  }
}
