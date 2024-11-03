import 'package:flutter/material.dart';
import 'menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Pemesanan Makanan",
      home: MenuPage(),
    );
  }
}
