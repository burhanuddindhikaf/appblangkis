import 'package:flutter/material.dart';
import 'halaman_dashboard.dart'; // Pastikan untuk mengimpor HalamanDashboard di sini
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

// ignore: must_be_immutable
class NotaPage extends StatelessWidget {
  final int harga; // Menggunakan ItemMenu
  final int jumlah;
  final int kembali; // Menyimpan jumlah kembali

  const NotaPage(
      {super.key,
      required this.harga,
      required this.jumlah,
      required this.kembali});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nota Anda")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pesanan Anda",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Total Harga:", style: TextStyle(fontSize: 18)),
            Text(
              "Rp. ${(harga).toString()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Total Bayar:", style: TextStyle(fontSize: 18)),
            Text(
              "Rp. ${(jumlah).toString()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Kembali:", style: TextStyle(fontSize: 18)),
            Text(
              "Rp. $kembali",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Ambil instance SharedPreferences
                SharedPreferences spInstance =
                    await SharedPreferences.getInstance();
                String? currentUsername = spInstance.getString(
                    "currentUsername"); // Ganti dengan kunci yang sesuai

                // Navigasi ke HalamanDashboard dengan username
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) =>
                        HalamanDashboard(spInstance, currentUsername ?? ''),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Kembali ke Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
