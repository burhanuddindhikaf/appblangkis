import 'package:flutter/material.dart';
// import 'data.dart'; // Pastikan untuk mengimpor data.dart di mana ItemMenu didefinisikan
import 'nota_page.dart'; // Impor NotaPage

// ignore: must_be_immutable
class PembayaranPage extends StatefulWidget {
  final int totalKeseluruhan; // Total transaksi

  const PembayaranPage({super.key, required this.totalKeseluruhan});

  @override
  State<StatefulWidget> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  TextEditingController jmlBayarCtrl = TextEditingController();
  int kembali = 0; // Menyimpan jumlah kembali

  void cetakNota() {
    int jmlBayar = int.tryParse(jmlBayarCtrl.text) ?? 0;
    kembali = jmlBayar - widget.totalKeseluruhan; // Hitung sisa kembali

    // Navigasi ke NotaPage dengan detail pembayaran
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotaPage(
          harga: widget.totalKeseluruhan,
          jumlah: jmlBayar,
          kembali: kembali, // Kirim sisa kembali ke NotaPage
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pembayaran")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Bayar:",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Rp. ${widget.totalKeseluruhan}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Field untuk memasukkan jumlah bayar
            TextField(
              controller: jmlBayarCtrl,
              decoration: const InputDecoration(labelText: "Jumlah Pembayaran"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: cetakNota, // Gabungkan fungsi di sini
              child: const Text("BAYAR"),
            ),
          ],
        ),
      ),
    );
  }
}
